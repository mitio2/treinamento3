Class Treinamento.Data.LogMensagem Extends (%Persistent, %XML.Adaptor)
{

Property Metodo As %String [ SqlColumnNumber = 2 ];

Property Classe As %String [ SqlColumnNumber = 3 ];

Property Inicio As %String [ SqlColumnNumber = 4 ];

Property Fim As %String [ SqlColumnNumber = 5 ];

Property Status As %Boolean [ SqlColumnNumber = 6 ];

Property StatusProcesso As %String [ SqlColumnNumber = 7 ];

Property ListaLog As list Of Treinamento.Data.VO.LogMensagem;

Index IdxStatus On Status;

ClassMethod CriarEntrada(pMetodo As %String, pClasse As %String) As Treinamento.Data.LogMensagem
{
    
    Set tSC = $$$OK    
    Try {
        #Dim exception as %Exception.General = ""
        #Dim statusCode as %Status = $SYSTEM.Status.OK()
        #Dim entry as LogMensagem   = ..%New()

        Set entry.Metodo = pMetodo
        set entry.Classe = pClasse
        Set entry.Inicio = $ZDatetime($HOROLOG,4)
        Set entry.Fim = ""
        Set entry.Status = statusCode
        set statusCode = entry.%Save()
    }
    Catch (exception) {
        Set tSC=exception.AsStatus()
        set erroMensagem = $SYSTEM.Status.GetErrorText(tSC)
        Throw exception
        
    }
    return entry
}

ClassMethod Finalizar(pIdLog As %Integer, pStatusProcess As %String, pStatusCode As %String) As Treinamento.Data.LogMensagem
{
    
    Set tSC = $$$OK    
    Try {
        #Dim exception as %Exception.General = ""
        #Dim statusCode as %Status = $SYSTEM.Status.OK()
        #Dim entry as LogMensagem   = ..%OpenId(pIdLog)

        Set entry.Fim = $ZDatetime($HOROLOG,4)
        set entry.StatusProcesso = pStatusProcess
        Set entry.Status = pStatusCode
        set statusLog = entry.%Save()
    }
    Catch (exception) {
        Set tSC=exception.AsStatus()
        set erroMensagem = $SYSTEM.Status.GetErrorText(tSC)
        Throw exception
        
    }
    return entry
}

ClassMethod ConsultaLog(pStatus As %String, pDataInicio As %String, pDataFim As %String) As Treinamento.Data.VO.LogMensagem
{
    Set tSC = $$$OK    
    Try {
        #Dim exception as %Exception.General = ""
        #Dim statusCode as %Status = $SYSTEM.Status.OK()
        #Dim SQL  As %String = ""
        #Dim resultSet as %ResultSet 
        #Dim entry as LogMensagem   = ..%New()

        Set SQL = "SELECT * FROM Treinamento_Data.LogMensagem where Status = "_pStatus
        Set SQL = SQL_" AND FIM<='"_pDataFim_"'"


       set resultSet = ##class(%ResultSet).%New()
       Set statusCode = resultSet.Prepare(SQL)
       Set statusCode = resultSet.Execute()
       if $SYSTEM.Status.Error(statusCode) return statusCode
       While (resultSet.Next()) {
         Set pItem=##class(Treinamento.Data.VO.LogMensagem).%New()
         Set pItem.Metodo = resultSet.%Get("Metodo")
         Set pItem.Classe = resultSet.%Get(("Classe"))
         Set pItem.Inicio = resultSet.%Get(("Inicio"))
         Set pItem.Fim = resultSet.%Get(("Fim"))
         Set pItem.Status = resultSet.%Get(("Status"))
         Set pItem.StatusProcesso = resultSet.%Get(("StatusProcesso"))
         Do entry.ListaLog.Insert((pItem))
       }
       return entry

        
    }
    Catch (exception) {
        Set tSC=exception.AsStatus()
        set erroMensagem = $SYSTEM.Status.GetErrorText(tSC)
        Throw exception
        
    }
    return entry
}

Storage Default
{
<Data name="LogMensagemDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Metodo</Value>
</Value>
<Value name="3">
<Value>Classe</Value>
</Value>
<Value name="4">
<Value>Inicio</Value>
</Value>
<Value name="5">
<Value>Fim</Value>
</Value>
<Value name="6">
<Value>Status</Value>
</Value>
<Value name="7">
<Value>StatusProcesso</Value>
</Value>
<Value name="8">
<Value>ListaLog</Value>
</Value>
</Data>
<DataLocation>^Treinamento.Data.LogMensagemD</DataLocation>
<DefaultData>LogMensagemDefaultData</DefaultData>
<IdLocation>^Treinamento.Data.LogMensagemD</IdLocation>
<IndexLocation>^Treinamento.Data.LogMensagemI</IndexLocation>
<StreamLocation>^Treinamento.Data.LogMensagemS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

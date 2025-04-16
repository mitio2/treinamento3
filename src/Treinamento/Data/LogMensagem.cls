Class Treinamento.Data.LogMensagem Extends (%Persistent, %XML.Adaptor)
{

Property Metodo As %String [ SqlColumnNumber = 2 ];

Property Classe As %String [ SqlColumnNumber = 3 ];

Property Inicio As %String [ SqlColumnNumber = 4 ];

Property Fim As %String [ SqlColumnNumber = 5 ];

Property Status As %Boolean [ SqlColumnNumber = 6 ];

Property StatusProcesso As %String [ SqlColumnNumber = 7 ];

Property ListaLog As list Of Treinamento.Data.VO.LogMensagem;

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
<ExtentSize>2</ExtentSize>
<IdLocation>^Treinamento.Data.LogMensagemD</IdLocation>
<IndexLocation>^Treinamento.Data.LogMensagemI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Classe">
<AverageFieldSize>13</AverageFieldSize>
<OutlierSelectivity>.999999:"LogMensagem"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Fim">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Inicio">
<AverageFieldSize>21</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="ListaLog">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Metodo">
<AverageFieldSize>11</AverageFieldSize>
<OutlierSelectivity>.999999:"LogMetodo"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Status">
<AverageFieldSize>3</AverageFieldSize>
<OutlierSelectivity>.999999:1</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="StatusProcesso">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^Treinamento.Data.LogMensagemS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

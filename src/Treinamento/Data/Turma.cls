Class Treinamento.Data.Turma Extends (%Persistent, %XML.Adaptor)
{

Property Instrutor As Treinamento.Data.Instrutor [ SqlColumnNumber = 2 ];

Property DataInicio As %Date [ SqlColumnNumber = 3 ];

Property Status As %String [ SqlColumnNumber = 4 ];

Property Alunos As list Of Treinamento.Data.Aluno [ SqlColumnNumber = 5 ];

Property Curso As Treinamento.Data.Curso [ SqlColumnNumber = 6 ];

/// VerificaStatus
Method VerificaStatus(curso As %String) As %String [ Language = objectscript ]
{
    Set statusTurma = ""
    Set SQL = "Select * from Treinamento_Data.Turma where Curso->Nome = '"_curso_"'"
    Set resultSet = ##class(%ResultSet).%New()
    Set status = resultSet.Prepare(SQL)
    Set status = resultSet.Execute()

    if resultSet.Next(){
        Set statusTurma = resultSet.Get("Status")
    }
    
    Return statusTurma
}

ClassMethod ImprimeTurma(curso As %String) As %String [ Language = objectscript ]
{
    
    Set Status = $$$OK    
    Set SQL = "Select * from Treinamento_Data.Turma where Curso->Nome = '"_curso_"'"    
    Set resultSet = ##class(%ResultSet).%New()

     Set status = resultSet.Prepare(SQL)
    if $SYSTEM.Status.IsError(Status) return Status
      
    Set status = resultSet.Execute()
    if $SYSTEM.Status.IsError(Status) return Status

    If resultSet.Next()
    {
        Set idTurma = resultSet.Get("ID")
        Set turma = ##class(Treinamento.Data.Turma).%OpenId(idTurma)
    }
    For x= 1:1: turma.Alunos.Count()
    {
         Set aluno = turma.Alunos.GetAt(x)
         W "Nome : "_aluno.Nome, " Matricula : "_aluno.Matricula, " Idade :"_aluno.Idade, !
    }
    return
}

Storage Default
{
<Data name="TurmaDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Instrutor</Value>
</Value>
<Value name="3">
<Value>DataInicio</Value>
</Value>
<Value name="4">
<Value>Status</Value>
</Value>
<Value name="5">
<Value>Alunos</Value>
</Value>
<Value name="6">
<Value>Curso</Value>
</Value>
</Data>
<DataLocation>^Treinamento.Data.TurmaD</DataLocation>
<DefaultData>TurmaDefaultData</DefaultData>
<IdLocation>^Treinamento.Data.TurmaD</IdLocation>
<IndexLocation>^Treinamento.Data.TurmaI</IndexLocation>
<StreamLocation>^Treinamento.Data.TurmaS</StreamLocation>
<Type>%Storage.Persistent</Type>


}

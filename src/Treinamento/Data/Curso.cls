Class Treinamento.Data.Curso Extends (%Persistent, %XML.Adaptor)
{

Property Nome As %String [ SqlColumnNumber = 2 ];

Property Duracao As %Integer [ SqlColumnNumber = 3 ];

Property Preco As %Integer [ SqlColumnNumber = 4 ];

Storage Default
{
<Data name="CursoDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Nome</Value>
</Value>
<Value name="3">
<Value>Duracao</Value>
</Value>
<Value name="4">
<Value>Preco</Value>
</Value>
</Data>
<DataLocation>^Treinamento.Data.CursoD</DataLocation>
<DefaultData>CursoDefaultData</DefaultData>
<IdLocation>^Treinamento.Data.CursoD</IdLocation>
<IndexLocation>^Treinamento.Data.CursoI</IndexLocation>
<StreamLocation>^Treinamento.Data.CursoS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

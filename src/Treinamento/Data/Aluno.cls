Class Treinamento.Data.Aluno Extends (%Persistent, %XML.Adaptor)
{

Property Nome As %String [ SqlColumnNumber = 2 ];

Property Matricula As %String [ SqlColumnNumber = 3 ];

Property Idade As %Integer [ SqlColumnNumber = 4 ];

Storage Default
{
<Data name="AlunoDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Nome</Value>
</Value>
<Value name="3">
<Value>Matricula</Value>
</Value>
<Value name="4">
<Value>Idade</Value>
</Value>
</Data>
<DataLocation>^Treinamento.Data.AlunoD</DataLocation>
<DefaultData>AlunoDefaultData</DefaultData>
<ExtentSize>3</ExtentSize>
<IdLocation>^Treinamento.Data.AlunoD</IdLocation>
<IndexLocation>^Treinamento.Data.AlunoI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Idade">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="Matricula">
<AverageFieldSize>6</AverageFieldSize>
<OutlierSelectivity>.999999:1981</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Nome">
<AverageFieldSize>17.67</AverageFieldSize>
<Selectivity>33.3333%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^Treinamento.Data.AlunoS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

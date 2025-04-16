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
<ExtentSize>1</ExtentSize>
<IdLocation>^Treinamento.Data.CursoD</IdLocation>
<IndexLocation>^Treinamento.Data.CursoI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Duracao">
<AverageFieldSize>3</AverageFieldSize>
<OutlierSelectivity>.999999:40</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Nome">
<AverageFieldSize>11</AverageFieldSize>
<OutlierSelectivity>.999999:"OBJScript"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Preco">
<AverageFieldSize>3</AverageFieldSize>
<OutlierSelectivity>.999999:1</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^Treinamento.Data.CursoS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

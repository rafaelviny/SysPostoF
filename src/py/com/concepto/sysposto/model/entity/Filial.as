package py.com.concepto.sysposto.model.entity
{
	import mx.collections.ArrayCollection;
	import py.com.concepto.components.types.LanguageType;

	[RemoteClass(alias="py.com.concepto.sysposto.model.entity.Filial")]
	[Bindable]
	public class Filial
	{
		private var _id:Number;
		private var _codigo:Number;
		private var _descricao:String;
		private var _empresa:Empresa;
		

		public function get empresa():Empresa
		{
			return _empresa;
		}

		public function set empresa(value:Empresa):void
		{
			_empresa = value;
		}

		public function get descricao():String
		{
			return _descricao;
		}

		public function set descricao(value:String):void
		{
			_descricao = value;
		}

		public function get codigo():Number
		{
			return _codigo;
		}

		public function set codigo(value:Number):void
		{
			_codigo = value;
		}

		public function get id():Number
		{
			return _id;
		}

		public function set id(value:Number):void
		{
			_id = value;
		}

	}
}
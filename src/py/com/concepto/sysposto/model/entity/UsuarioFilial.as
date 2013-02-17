package py.com.concepto.sysposto.model.entity
{
	

	[RemoteClass(alias="py.com.concepto.sysposto.model.entity.UsuarioFilial")]
	[Bindable]
	public class UsuarioFilial
	{
		private var _id:Number;
		private var _filial:Filial;
		private var _usuario:Usuario;
		
	
		public function UsuarioFilial()
		{
		}
		
	
		public function get usuario():Usuario
		{
			return _usuario;
		}

		public function set usuario(value:Usuario):void
		{
			_usuario = value;
		}

		public function get filial():Filial
		{
			return _filial;
		}

		public function set filial(value:Filial):void
		{
			_filial = value;
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
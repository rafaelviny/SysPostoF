package py.com.concepto.sysposto.model.entity
{
	import mx.collections.ArrayCollection;
	
	import py.com.concepto.components.types.LanguageType;

	[RemoteClass(alias="py.com.concepto.sysposto.model.entity.Usuario")]
	[Bindable]
	public class Usuario
	{
		private var _id:Number;
		private var _codigo:Number;
		private var _nome:String;
		private var _login:String;
		private var _senha:String;
		private var _novaSenha:String;
		private var _ativo:Boolean;
		private var _primeiroAcesso:Boolean;
		private var _salvarSenha:Boolean;
		private var _language:LanguageType;
		private var _confirmarSenha:String;
		private var _lembrete:String;
		private var _usuarioFilialList:ArrayCollection;
		
		public function Usuario()
		{
		}
		
	
		public function get usuarioFilialList():ArrayCollection
		{
			return _usuarioFilialList;
		}

		public function set usuarioFilialList(value:ArrayCollection):void
		{
			_usuarioFilialList = value;
		}

		public function get lembrete():String
		{
			return _lembrete;
		}

		public function set lembrete(value:String):void
		{
			_lembrete = value;
		}

		public function get confirmarSenha():String
		{
			return _confirmarSenha;
		}

		public function set confirmarSenha(value:String):void
		{
			_confirmarSenha = value;
		}

		public function get novaSenha():String
		{
			return _novaSenha;
		}

		public function set novaSenha(value:String):void
		{
			_novaSenha = value;
		}

		public function get language():LanguageType
		{
			return _language;
		}

		public function set language(value:LanguageType):void
		{
			_language = value;
		}

		public function get salvarSenha():Boolean
		{
			return _salvarSenha;
		}

		public function set salvarSenha(value:Boolean):void
		{
			_salvarSenha = value;
		}

		public function get primeiroAcesso():Boolean
		{
			return _primeiroAcesso;
		}

		public function set primeiroAcesso(value:Boolean):void
		{
			_primeiroAcesso = value;
		}

		public function get ativo():Boolean
		{
			return _ativo;
		}

		public function set ativo(value:Boolean):void
		{
			_ativo = value;
		}

		public function get senha():String
		{
			return _senha;
		}

		public function set senha(value:String):void
		{
			_senha = value;
		}

		public function get login():String
		{
			return _login;
		}

		public function set login(value:String):void
		{
			_login = value;
		}

		public function get nome():String
		{
			return _nome;
		}

		public function set nome(value:String):void
		{
			_nome = value;
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
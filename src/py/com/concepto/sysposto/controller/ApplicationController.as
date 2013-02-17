package py.com.concepto.sysposto.controller
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.utils.ByteArray;
	import flash.utils.flash_proxy;
	
	import mx.collections.HierarchicalData;
	import mx.core.FlexGlobals;
	import mx.graphics.codec.PNGEncoder;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import py.com.concepto.components.CloseTabBar;
	import py.com.concepto.components.ControllerBase;
	import py.com.concepto.components.core.resource.WMResourceManager;
	import py.com.concepto.components.dialogs.Alert;
	import py.com.concepto.components.events.CloseTabBarEvent;
	import py.com.concepto.components.events.LoginEvent;
	import py.com.concepto.components.events.MenuEvent;
	import py.com.concepto.components.forms.TemplateForm;
	import py.com.concepto.sysposto.constants.ServiceConstant;
	import py.com.concepto.sysposto.model.entity.Filial;
	import py.com.concepto.sysposto.model.entity.Usuario;
	import py.com.concepto.sysposto.model.entity.UsuarioFilial;

	public class ApplicationController extends ControllerBase
	{
		private static var instance:ApplicationController;
		
		//*****************************************************************************************************
		//Serach Dialog Factory--------------------------------------------------------------------------------
		/*[Bindable]
		public var companySearchDialogFactory:SearchDialogFactory;
		
		[Bindable]
		public var contactSearchDialogFactory:SearchDialogFactory;	
		
		[Bindable]
		public var companyUnitSearchDialogFactory:SearchDialogFactory;*/
		//Serach Dialog Factory--------------------------------------------------------------------------------
		//*****************************************************************************************************
		
		
		//*****************************************************************************************************
		//Variables--------------------------------------------------------------------------------------------
		/**User logged in sistem*/
		[Bindable]
		public var loggedUser:Usuario;

		[Bindable]
		public var loggedFilial:Filial;
		
		[Embed(source="py/com/concepto/sysposto/assets/LogoACS.png")]
		private var _companyLogo:Class;
		
		
		//Variables--------------------------------------------------------------------------------------------
		//*****************************************************************************************************
				
		public function ApplicationController()
		{
			if(instance != null){
				throw new Error("use the getInstance() method");
			}
			
			/*companyUnitSearchDialogFactory 	= new SearchDialogFactory(CompanyUnitSearchDialog);
			companySearchDialogFactory 		= new SearchDialogFactory(CompanySearchDialog);
			contactSearchDialogFactory		= new SearchDialogFactory(ContactSearchDialog)*/
			instance = this;
		}
		
		//*****************************************************************************************************
		//Registering Classes----------------------------------------------------------------------------------
		/**Registering the classes that will be used in application, necessary to serialization*/
		private function registryClasses():void{
			/*registerClassAlias("br.com.db1.acs.components.interfaces.ICompactUnitModel", ICompactUnitModel);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.GroupInfo_DTO", GroupInfo_DTO);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.Unit_DTO", Unit_DTO);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.Address_DTO", Address_DTO);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.Company_DTO", Company_DTO);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.CompactUnitModel", CompactUnitModel);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.ContactInfo_DTO", ContactInfo_DTO);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.Group_DTO", Group_DTO);	
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.User_DTO", User_DTO);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.AnalogConsolidatedData_DTO", AnalogConsolidatedData_DTO);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.Analog_DTO", AnalogMainInfo_DTO);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.AnalogMainData_DTO", AnalogMainData_DTO);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.AnalogData_DTO", AnalogData_DTO);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.AlarmCfg_DTO", AlarmCfg_DTO);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.AlarmAnnunciator_DTO", Alarm_DTO);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.SmallestUnitModel_DTO", AlarmAnnunciator_DTO);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.SearchAlarmCfg_DTO", SearchAlarmCfg_DTO);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.AckReturn_DTO", AckReturn_DTO);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.EmailsGroup_DTO", EmailsGroup_DTO);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.EmailAddress_DTO", EmailAddress_DTO);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.GtwSchedule_DTO", GtwSchedule_DTO);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.GtwScheduleEdition_DTO", GtwScheduleEdition_DTO);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.Gateway_DTO", Gateway_DTO);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.GatewayISP_DTO", GatewayISP_DTO);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.GatewayProxy_DTO", GatewayProxy_DTO);
			registerClassAlias("br.com.db1.Concepto.model.entity.dto.GatewayServer_DTO", GatewayServer_DTO);*/
		}
		//Registering Classes----------------------------------------------------------------------------------
		//*****************************************************************************************************
		
		/**Return the current instance of application controller*/
		public static function getInstance():ApplicationController{			
			return instance;
		}
		
		/**Easier way to get the default application with your type*/
		public function get application():ConceptoSistemas{
			return FlexGlobals.topLevelApplication as ConceptoSistemas;
		}
		
		
		/**Close a tab in viewNavigator*/
		public function closeTabHandler(event:CloseTabBarEvent):void
		{
			
			var templateTab:TemplateForm = (event.currentTarget as CloseTabBar).dataProvider.getItemAt(event.itemIndex) as TemplateForm;
			templateTab.closePending = true;
			
			if(templateTab.validateForBrowse()){
				application.viewNavigator.removeElementAt(event.itemIndex);
				templateTab.closePending = false;
				templateTab.kill();
				templateTab = null;
			}
		}
		
		
		/**Open a new Form, this method set to the args of a new template*/
		public function menuOpenForm(event:MenuEvent, args:Object = null):void
		{
			
			if(application.viewNavigator == null){
				return;
			}
			var formClass:Class = event.formClass
			var form:TemplateForm = isOpen(formClass);
			
			if(form == null){				
			
				form = new formClass();	
				form.args = args;
				application.viewNavigator.addElement(form);
			}else{
				form.args = args;
				form.onOpenByMenu();
			}
			
			
			application.viewNavigator.selectedChild = form;
			
			
			
		}
		
		/**Easier way to open a form in programmatically mode*/
		public function simpleOpenForm(templateForm:Class, args:Object = null):void{
				menuOpenForm(new MenuEvent("openForm", templateForm), args);
		}
		
		/**checks if the form is open, if so returns the instance*/
		public function isOpen(formClass:Class):TemplateForm{
		
			if(application.viewNavigator == null){
				return null;
			}
			
			for each(var f:TemplateForm in application.viewNavigator.getChildren()){
				if(f is formClass){
					return f;
				}
			}
			
			return null;
		}
		
		//Registering Classes----------------------------------------------------------------------------------
		//*****************************************************************************************************
		
		//*****************************************************************************************************
		//Login------------------------------------------------------------------------------------------------
		/**Invokes the remote login*/
		public function doLogin(evt:LoginEvent):void{
			remote.destination = ServiceConstant.USUARIOSERVICE;	
			service.executeServiceCall(remote.findUsuarioByAutentificacao(evt.user, evt.password), loginSucces,loginFault);
		}
		
		/**When the login is success, sets the logged user and checks if is the first access*/
		private function loginSucces(sender:ResultEvent):void{
			loggedUser = sender.result as Usuario;
			if(loggedUser.codigo == -404){
				showLoginErrorMessage(WMResourceManager.getAdvancedResourceString(this,"userNotFount","Concepto") );
				return;
			}
			
			if (sender.result != null && loggedUser.primeiroAcesso == false) {
				if(loggedUser.usuarioFilialList.length > 1){
					application.applicationFilialList()
					return;
				}else{
					application.applicationLogin();
					remote.destination = ServiceConstant.FILIALERVICE;
					var usuarioFilial:UsuarioFilial = loggedUser.usuarioFilialList.getItemAt(0) as UsuarioFilial;
					service.executeServiceCall(remote.findById(usuarioFilial.filial.id), findFilialByIdSucces,findFilialByIdFault);
					return;
				}
					
			} else if (sender.result != null && loggedUser.primeiroAcesso == true) {
				Alert.showSimpleInfoFromKey(WMResourceManager.getResourceKey(this, "loginSucces.firstAccess"));
				application.loginScreen.preInitializeToChangePassword(null);
				return;
			}
			showLoginErrorMessage(WMResourceManager.getAdvancedResourceString(this,"loginSucces","Concepto") );
		}
		
		private function findFilialByIdSucces(event:ResultEvent):void
		{
			loggedFilial = event.result as Filial;
			
		}
		
		private function findFilialByIdFault(fault:FaultEvent):void
		{
			// TODO Auto Generated method stub
			
		}
		
		/**The login method returned error*/
		private function loginFault(fault:FaultEvent):void{
			showLoginErrorMessage(WMResourceManager.getAdvancedResourceString(this,"loginFault","Concepto") );
		}
		
		
		
		//Login------------------------------------------------------------------------------------------------		
		//*****************************************************************************************************
		
		//*****************************************************************************************************
		//Change PassWord--------------------------------------------------------------------------------------		
		/**Show the login in the for change passWord*/
		public function showLoginToChangePassword():void{
			application.loginScreen.preInitializeToChangePassword(null);
			showLoginWindow();
		}
		
		/**Changes the pass word*/
		public function doChangePassword(evt:LoginEvent):void{
			remote.destination = ServiceConstant.USUARIOSERVICE;
			loggedUser.senha = evt.newPassword;
			loggedUser.lembrete = evt.passwordReminder;
			loggedUser.primeiroAcesso = false;
			service.executeServiceCall(remote.update(loggedUser), doChangePasswordSucces, doChangePasswordFault); 
		}
		
		/**The password was changed with success. But can receive a error of the exception of rules*/
		private function doChangePasswordSucces(sender:ResultEvent):void{
			
				Alert.showFromKey(WMResourceManager.getResourceKey(this, "doChangePasswordSucces.0"));
				application.applicationLogin()	
		}
		
		/**Not was possible change the password, the method cannot accessed*/
		private function doChangePasswordFault(sender:FaultEvent):void {
			Alert.showFromKey(WMResourceManager.getResourceKey(this, "doChangePasswordFault"));
		}
		
		//Change PassWord--------------------------------------------------------------------------------------	
		//*****************************************************************************************************
		
		/**Make a logout, hide the sistem and show login window*/
		public function doLogout():void{
			application.applicationLogout();
			showLoginWindow();				
		}
		
		/**Show the login window*/
		private function showLoginWindow():void{
			application.viewContainer.selectedChild = application.viewLogin;
		}
		
		/**Put in the login window a error message*/
		private function showLoginErrorMessage(error:String):void{
			application.loginScreen.errorText.visible = true;
			application.loginScreen.errorText.includeInLayout = true;
			application.loginScreen.errorText.text = error;
		}
		
		
		public function get companyLogo():ByteArray{
			var imageByteArray:ByteArray = new ByteArray();
			var bitmap:Bitmap = new _companyLogo();
			var bitmapData:BitmapData = bitmap.bitmapData;
			bitmapData.draw(bitmap);
			var encoder:PNGEncoder = new PNGEncoder();
			imageByteArray = encoder.encode(bitmapData);
			
			
			return imageByteArray;
		}
		
		//-----------------------------------------------------------------------------------------------------
		//END OF CONTROLLER************************************************************************************		
	}
}
package py.com.concepto.sysposto.controller
{
	import mx.collections.ArrayCollection;
	import mx.collections.HierarchicalData;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	import py.com.concepto.components.ControllerBase;
	import py.com.concepto.sysposto.constants.ServiceConstant;
	import py.com.concepto.sysposto.model.entity.Empresa;
	import py.com.concepto.sysposto.model.entity.Filial;

	public class FilialController extends ControllerBase
	{

		[Bindable]			
		public var dataSource:HierarchicalData;
		
		
		
		public function FilialController()
		{
			super();
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
//**********************************************************************************************************
//                            pesquisa feita apos a realizacao do login
//**********************************************************************************************************		
		
		public function pesquisaFiliaisPorUsuario():void
		{
			remote.destination = ServiceConstant.FILIALERVICE;
			service.executeServiceCall(remote.findListFilialByUsuarioId(ApplicationController.getInstance().loggedUser.id), findSucces,findFault);
			
			
		}
		private function findSucces(resultEvent:ResultEvent):void
		{
			var list:ArrayCollection = new ArrayCollection();
			var listFormadatada:ArrayCollection = new ArrayCollection();
			var object:Object;
			var empresa:Empresa = new Empresa();
			for each (var i:Filial in resultEvent.result) 
			{
				object= new Object();
				object.filial = i;
				empresa = i.empresa;
				list.addItem(object);
			}
			
			var dpHierarchy:ArrayCollection = new ArrayCollection([
				{emp:empresa, filiais: list.source}
			]);
			
			var finalObject:Object = new Object();
			finalObject.empresa= empresa;
			finalObject.filiais=list;
			listFormadatada.addItem(list);
			
			dataSource =  new HierarchicalData(dpHierarchy);
			dataSource.childrenField = "filiais";
		}
		
		private function findFault(sender:FaultEvent):void
		{
			
		}

		
		
		
	}
}
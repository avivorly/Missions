Ext.define('Report.mission', {
	extend: 'Ext.data.Model',
	fields: [
		['id', 'integer'],
		['title', 'string'],
		['details', 'string'],
		['done', 'boolean']
	].map(function(field) {
				return {name: field[0],
					type: field[1]
				}
			})
});

Ext.define('Missions.missionStore', {
	extend: 'Ext.data.Store',
	autoLoad: true,
	autoSync: true,
	storeId: 'missionStore',
	model: 'Missions.mission',
	proxy: {
		type: 'rest',
		url: '/miss6hions.json'
	}
});

//Ext.define('Missions.soldierForm', {
//	extend: 'Ext.form.Panel',
//	frame: true,
//	buttonAlign: 'center',
//	width: 350,
//	defaults: {
//		xtype: 'textfield',
//		allowBlank: false
//	},
//	buttons: [
//		{
//			text: I18n.t('panels.perform'),
//			formBind: true,
//			disabled: true,
//			handler: function() {
//				var form = this.up('form');
//				form.getForm().submit({
//					url: '/soldiers/' + form.action,
//					success: function(basicForm, operation) {
//						form.up('window').close();
//						Ext.ux.Notification.msg(Ext.ux.get_msg(operation));
//						Ext.getStore('soldierStore').load();
//					},
//					failure: function(form, operation) {
//						Ext.Msg.alert(I18n.t('panels.invalid_data'), Ext.ux.get_msg(operation));
//					}
//				})
//			}}
//	],
//	items: [
//		{
//			xtype: 'hiddenfield',
//			name: 'id'
//		},
//		{
//			fieldLabel: I18n.t('activerecord.attributes.soldier.unit'),
//			name: 'unit_id',
//			xtype: 'listcombobox',
//			store: 'unit'
//		},
//		{
//			fieldLabel: I18n.t('activerecord.attributes.soldier.first_name'),
//			name: 'first_name',
//			vtype: 'name'
//		},
//		{
//			fieldLabel: I18n.t('activerecord.attributes.soldier.last_name'),
//			name: 'last_name',
//			vtype: 'name'
//		},
//		{
//			fieldLabel: I18n.t('activerecord.attributes.soldier.personal_number'),
//			name: 'personal_number',
//			fieldCls: 'dimming',
//			readOnly: this.isEdit,
//			vtype: 'personalnumber'
//		},
//		{
//			fieldLabel: I18n.t('activerecord.attributes.soldier.rank'),
//			name: 'rank_id',
//			xtype: 'listcombobox',
//			store: 'rank'
//		},
//		{
//			fieldLabel: I18n.t('activerecord.attributes.soldier.parent'),
//			name: 'parent_id',
//			xtype: 'listcombobox',
//			store: 'soldier'
//		}
//	]
//});

//Ext.define('Missions.soldierWindow', {
//	extend: 'Missions.FormWindow',
//	title: I18n.t('panels.soldier_form'),
//	initComponent: (function() {
//		var me = this;
//		var soldierForm = Ext.create('Missions.soldierForm', me.formParams);
//		this.items = [ soldierForm ];
//		this.callParent();
//	})
//});

Ext.define('Missions.missionsGrid', {
	extend: 'Ext.grid.Panel',
	title: 'משימות',
	anchor: '100% 100% ',
//	tbar: [
//		{
//			text: I18n.t('panels.add_soldier'),
//			handler: function() {
//				Ext.create('Missions.soldierWindow', {formParams: {action: 'new'}}).show();
//			}
//		}
//	],
	columns: [
		{
			width: 250,
			header: 'id',//I18n.t('activerecord.attributes.soldier.unit'),
			type: 'integer',
			dataIndex: 'id'
		},
		{
			header: 'כותרת',
			type: 'string',
			dataIndex: 'title'
		},
		{
			header: 'פירוט',
			type: 'string',
			dataIndex: 'details'
		}
	],
	initComponent: (function() {
		this.store = Ext.create('Missions.missionStore');
		this.callParent(arguments);
	})
});
<?php
if (!defined('_PS_VERSION_'))
    exit;
class Pinta_Schemaorg extends Module
{
    /**
     * Pinta_Schemaorg constructor.
     */
    public function __construct()
    {
        $this->name = 'pinta_schemaorg';
        $this->tab = 'others';
        $this->version = '1.0';
        $this->module_key = '576ef30dd8ad3d43aa9b501e716d9333';
        $this->author = 'PintaWebware';
        $this->need_instance = 1;
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Schema.org');
        $this->description = $this->l('Generation schema.org');

        $this->confirmUninstall = $this->l('Are you sure you want to uninstall?');
        $this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_);


    }

    public function install()
    {
        Configuration::updateValue('PINTA_SCHEMAORG', true);

        $this->defaultSetting();
        return parent::install() &&
            $this->registerHook('header');
    }


    public function uninstall()
    {
        if (!parent::uninstall() ||
            !Configuration::deleteByName('PINTA_SCHEMAORG'))
            return false;
        return true;
    }

    public function getContent()
    {
        $output = null;

        $table = "";
        $table = $this->initContentSetting();
        $this->context->smarty->assign('table',$table);
        $output = $this->context->smarty->fetch($this->local_path.'views/templates/admin/pinta_schemaorg.tpl');

        return $output.$this->display($this->local_path, 'views/templates/admin/prestui/ps-tags.tpl');
    }

    public function defaultSetting()
    {

        $settings['pinta_schema_org_status'] = 1;
        $settings['pinta_schema_org_select_product'] = 1;
        $settings['pinta_schema_org_select_breadcrumb_list'] = 1;
        $settings['pinta_schema_org_select_organization'] = 1;
        $settings['pinta_schema_org_select_website'] = 1;
        $settings['pinta_schema_org_select_place'] = 0;
        $settings['pinta_schema_org_select_times'] = 0;

        $settings['pinta_schema_org_select_organization_telefon'] = array(
            0 =>"",);
        $settings['pinta_schema_org_select_organization_url'] = array(
            0 =>"",
        );
    foreach ($settings as $key => $val){
        Configuration::updateValue($key, $val);
    }

    return ;

    }
        function initContentSetting()
        {
            $table['pinta_schema_org_status'] = Configuration::get("pinta_schema_org_status");
            $table['pinta_schema_org_select_product'] = Configuration::get("pinta_schema_org_select_product");
            $table['pinta_schema_org_select_breadcrumb_list'] = Configuration::get("pinta_schema_org_select_breadcrumb_list");
            $table['pinta_schema_org_select_website'] = Configuration::get("pinta_schema_org_select_website");
            $table['pinta_schema_org_select_organization'] = Configuration::get("pinta_schema_org_select_organization");
            $table['pinta_schema_org_select_place'] = Configuration::get("pinta_schema_org_select_place");
            $table['pinta_schema_org_select_times'] = Configuration::get("pinta_schema_org_select_times");

            return $table;
        }


}
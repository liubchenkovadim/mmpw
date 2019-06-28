
{*
* 2007-2019 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2019 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<style>
    .optionsform {
        padding: 5px;
    }

    .disabled_button, .disabled_button:hover, .disabled_button:focus, .disabled_button:active:focus, .disabled_button:active:hover {
        color: #fff;
        cursor: unset;
        background-color: #a8afb3;
        border-color: #a8afb3;
        outline: 0px auto -webkit-focus-ring-color;
    }

    .max-bottom-ul .dropdown-menu {
        width: 99%;
        max-height: 250px;
        overflow-y: auto;
    }
    ul.ui-autocomplete {
        text-align:left;
        width: 150px;
    }
    .ui-autocomplete
    {
        max-height: 200px;
        overflow-y: auto;
        overflow-x: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    li.ui-menu-item .ui-menu-item-wrapper {
        display: block;
        white-space: pre-wrap;
    }

    .btn_get_xml{
        display: none;
    }
    #btn_for_trigger{
        display: none;
    }
    .btn-secondary:hover{
        background-color: #BEBEBE;
    }
    div.alert{
        display: none;
    }
    .bootstrap .form-group{
        margin-bottom: 0;
    }
    .text-rigth{
        text-align: right;
    }
    #link-update{
        margin-left: 72px;
    }
    .alert-warning1{
        background-color: red;
        color: white;
    }
</style>
<div class="module_confirmation conf confirm alert alert-success">
    <button type="button" class="close">×</button>
    The settings have been updated.
</div>

<div class="module_confirmation conf confirm alert alert-warning1">
    <button type="button" class="close">×</button>
    Saving error. Fields no change
</div>
<div class="module_confirmation conf confirm alert alert-warning2">
    <button type="button" class="close">×</button>
    Saving error.Re-select matching options
</div>
<div class="module_confirmation conf confirm alert alert-warning3">
    <button type="button" class="close">×</button>
    Saving error.Re-select google main categories
</div>

<div class="module_confirmation conf confirm alert alert-warning4">
    <button type="button" class="close">×</button>
    Saving settings error.Re-select google subcategories
</div>
<div class="panel">
    <h3>
        <i class="icon icon-credit-card"></i>
        {l s='Setting list' mod='pinta_schemaorg'}
    </h3>

    <div class="row">

        <div class="col-md-12 col-sm-12">
            <div class="panel panel-default">


                <div class="panel-body">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="setting-tab" data-toggle="tab" href="#setting"
                               role="tab" aria-controls="setting"
                               aria-selected="true">{l s='Setting' mod='pinta_schemaorg'}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="product-tab" data-toggle="tab" href="#product"
                               role="tab" aria-controls="product"
                               aria-selected="false">{l s='Product' mod='pinta_schemaorg'}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="breadcrumb-tab" data-toggle="tab" href="#breadcrumb"
                               role="tab" aria-controls="breadcrumb"
                               aria-selected="false">  {l s='BreadcrumbList' mod='pinta_schemaorg'}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="website-tab" data-toggle="tab" href="#website"
                               role="tab" aria-controls="website"
                               aria-selected="false">{l s='Website' mod='pinta_schemaorg'}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="organization-tab" data-toggle="tab" href="#organization"
                               role="tab" aria-controls="organization"
                               aria-selected="false">{l s='Organization' mod='pinta_schemaorg'}</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="place-tab" data-toggle="tab" href="#place"
                               role="tab" aria-controls="place"
                               aria-selected="false">{l s='Select Place' mod='pinta_schemaorg'}</a>
                        </li>
                    </ul>

                    <form action="<?php echo $save ; ?>" method="post" id="form-setting">

                        <div class="tab-content" id="myTabContent">

                            <div class="tab-pane fade show active in" id="setting" role="tabpanel"
                                 aria-labelledby="setting-tab">

                                <div class="form-group">
                                    <label class="col-sm-2 control-label"
                                           for="pinta_schema_org_status">{l s='Status' mod='pinta_schemaorg'}</label>
                                    <div class="col-sm-10">
                                        <select name="pinta_schema_org_status"
                                                id="pinta_schema_org_status" class="form-control">

                                            <option value="1" {if ( $table['pinta_schema_org_status'] == 1 )} selected ='selected';{/if} >{l s='On' mod='pinta_schemaorg'}</option>
                                            <option value="0" {if ( $table['pinta_schema_org_status'] == 0 )}  selected ='selected' {/if}  >{l s='Off' mod='pinta_schemaorg'}</option>
                                        </select>
                                    </div>
                                </div>

                            </div>
                            <div class="tab-pane fade" id="product" role="tabpanel"
                                 aria-labelledby="product-tab">
                                <table class="table schema_org">
                                    <tr>
                                        <td>
                                            <div class="form-check">

                                                <input class="form-input" type="checkbox"
                                                       name="pinta_schema_org_select_product"
                                                       value="1"
                                                {if ( $table['pinta_schema_org_select_product'] == 1) } checked ='checked'{/if}
                                                id="pinta_schema_org_select_product"
                                                >
                                                <label class="form-check-label"
                                                       for="pinta_schema_org_select_product">
                                                    {l s='Product' mod='pinta_schemaorg'}
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                </table>

                            </div>
                            <div class="tab-pane fade" id="breadcrumb" role="tabpanel"
                                 aria-labelledby="breadcrumb-tab">
                                <table class="table schema_org">
                                    <tr>
                                        <td>
                                            <div class="form-check">


                                                <input class="form-input" type="checkbox"
                                                       name="pinta_schema_org_select_breadcrumb_list"
                                                       value="1"
                                                {if ( $table['pinta_schema_org_select_breadcrumb_list'] == 1) } checked ='checked'{/if}
                                                id="pinta_schema_org_select_breadcrumb_list"
                                                >
                                                <label class="form-check-label"
                                                       for="pinta_schema_org_select_breadcrumb_list">
                                                    {l s='BreadcrumbList' mod='pinta_schemaorg'}
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                </table>

                            </div>
                            <div class="tab-pane fade" id="website" role="tabpanel"
                                 aria-labelledby="website-tab">
                                <table class="table schema_org">
                                    <tr>
                                        <td>
                                            <div class="form-check">

                                                <input class="form-input" type="checkbox"
                                                       name="pinta_schema_org_select_website"
                                                       value="1"
                                                {if ( $table['pinta_schema_org_select_website'] == 1 )} checked ='checked'{/if}
                                                id="pinta_schema_org_select_website"
                                                >
                                                <label class="form-check-label"
                                                       for="pinta_schema_org_select_website">
                                                    {l s='Website' mod='pinta_schemaorg'}
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                </table>

                            </div>
                            <div class="tab-pane fade" id="organization" role="tabpanel"
                                 aria-labelledby="organization-tab">
                                <table class="table border_none schema_org">
                                    <tr>
                                        <td colspan="3">
                                            <div class="form-check">

                                                <input class="form-input" type="checkbox"
                                                       name="pinta_schema_org_select_organization"
                                                       value="1"
                                                {if ( $table['pinta_schema_org_select_organization'] == 1) } checked ='checked'{/if}
                                                id="pinta_schema_org_select_organization"
                                                >
                                                <label class="form-check-label"
                                                       for="pinta_schema_org_select_organization">
                                                    {l s='Organozation' mod='pinta_schemaorg'}
                                                </label>
                                            </div>
                                        </td>
                                    </tr>


                                    <tr class="organization">
                                        <td colspan="3"><h2><?php echo $colum_select_organization ; ?></h2></td>

                                    </tr>
                                    <?php  $k = 0 ;?>
                                    <?php  foreach($pinta_schema_org_select_organization_url as $element) { ?>
                                    <tr class="organization-url">
                                        <td>

                                            <div class="form-group">
                                                <label for="organization_url"><?php echo $addres_site ; ?></label>
                                                <input type="text" class="form-control url"
                                                       id="organization_url"
                                                       name="pinta_schema_org_select_organization_url[<?php echo $k ; ?>]"
                                                       value="<?php echo $element ; ?>  ">
                                            </div>

                                        </td>
                                        <td><a class="add_url btn btn-primary">+</a></td>
                                        <td>
                                            <?php if( $k != 0){ ?>
                                            <a class="delete_url btn btn-danger">-</a>
                                            <?php  } ?></td>

                                    </tr>
                                    <?php $k = $k+1 ;?>
                                    <?php  } ?>
                                    <?php  $i = 0;?>
                                    <?php  foreach($pinta_schema_org_select_organization_telefon as $item) { ?>
                                    <tr class="organization-telefon">
                                        <td>

                                            <div class="form-group">

                                                <label for="organization_tel[<?php echo $i ; ?>]"><?php echo $telefon ; ?></label>
                                                <input type="text" class="form-control telefon"
                                                       id="organization_tel[<?php echo $i ; ?>]"
                                                       name="pinta_schema_org_select_organization_telefon[<?php echo $i ; ?>]"
                                                       value="<?php echo $item ; ?>">

                                            </div>


                                        </td>
                                        <td><a class="add_telefon btn btn-primary">+</a></td>
                                        <td>
                                            <?php if( $i != 0){ ?>
                                            <a class="delete_telefon btn btn-danger">-</a>
                                            <?php  } ?></td>
                                    </tr>
                                    <?php  $i = $i+1 ;?>
                                    <?php  } ?>
                                </table>
                            </div>
                            <div class="tab-pane fade " id="place" role="tabpanel"
                                 aria-labelledby="place-tab">

                                <table class="table border_none schema_org">
                                    <tr>
                                        <td colspan="6">
                                            <div class="form-check">

                                                <input class="form-input" type="checkbox"
                                                       name="pinta_schema_org_select_place"
                                                       value="1"
                                                {if ( $table['pinta_schema_org_select_place'] == 1) } checked ='checked'{/if}
                                                id="pinta_schema_org_select_place"
                                                >
                                                <label class="form-check-label"
                                                       for="pinta_schema_org_select_place">
                                                    <?php echo $colum_select_place ; ?>
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr class="adress">
                                        <td colspan="2">
                                            <label class="form-check-label"
                                                   for="pinta_schema_org_select_place_adress[name]">
                                                <?php echo $colum_select_place_name ; ?>
                                            </label>
                                        </td>
                                        <td colspan="4">
                                            <input type="text" class="form-control" name="pinta_schema_org_select_place_adress[name]"
                                                   value="<?php if(!empty($pinta_schema_org_select_place_adress['name'])){
                                                           echo $pinta_schema_org_select_place_adress['name'] ; } ?>">
                                        </td>

                                    </tr>
                                    <tr class="adress">
                                        <td colspan="2" >
                                            <label class="form-check-label"
                                                   for="pinta_schema_org_select_place_adress[city]">
                                                <?php echo $colum_select_place_city ; ?>
                                            </label>
                                        </td>
                                        <td colspan="4">
                                            <input type="text" class="form-control" name="pinta_schema_org_select_place_adress[city]"
                                                   value="<?php if(!empty($pinta_schema_org_select_place_adress['city'])){
                                                           echo $pinta_schema_org_select_place_adress['city'] ; } ?>">
                                        </td>

                                    </tr>
                                    <tr class="adress" >
                                        <td colspan="2">
                                            <label class="form-check-label"
                                                   for="pinta_schema_org_select_place_adress[region]">
                                                <?php echo $colum_select_place_region ; ?>
                                            </label>
                                        </td>
                                        <td colspan="4">
                                            <input type="text" class="form-control" name="pinta_schema_org_select_place_adress[region]"
                                                   value="<?php if(!empty($pinta_schema_org_select_place_adress['region'])){
                                                           echo $pinta_schema_org_select_place_adress['region'] ; } ?>">
                                        </td>

                                    </tr>
                                    <tr class="adress" >
                                        <td colspan="2">
                                            <label class="form-check-label"
                                                   for="pinta_schema_org_select_place_adress[adress]">
                                                <?php echo $colum_select_place_adress ; ?>
                                            </label>
                                        </td>
                                        <td colspan="4" >
                                            <input type="text" class="form-control" name="pinta_schema_org_select_place_adress[adress]"
                                                   value="<?php if(!empty($pinta_schema_org_select_place_adress['adress'])){
                                                           echo $pinta_schema_org_select_place_adress['adress'] ; } ?>">    </td>

                                    </tr>
                                    <tr class="adress" >
                                        <td colspan="2">
                                            <label class="form-check-label"
                                                   for="pinta_schema_org_select_place_adress[index]">
                                                <?php echo $colum_select_place_index ; ?>
                                            </label>
                                        </td>
                                        <td colspan="4">
                                            <input type="text"  class="form-control" name="pinta_schema_org_select_place_adress[index]"
                                                   value="<?php if(!empty($pinta_schema_org_select_place_adress['index'])){
                                                           echo $pinta_schema_org_select_place_adress['index'] ; } ?>">
                                        </td>

                                    </tr>
                                    <tr>
                                        <td  class="adress" colspan="6">
                                            <div class="form-check">

                                                <input class="form-input" type="checkbox"
                                                       name="pinta_schema_org_select_times"
                                                       value="1"
                                                {if ( $table['pinta_schema_org_select_times'] == 1) } checked ='checked'{/if}
                                                id="pinta_schema_org_select_times"
                                                >
                                                <label class="form-check-label"
                                                       for="pinta_schema_org_select_times">
                                                    <?php echo $colum_select_time ; ?>
                                                </label>
                                            </div>
                                        </td>
                                    </tr>
                                    {if ( empty($pinta_schema_org_select_time_full))}
                                    <tr class="time-tr">
                                        <td>
                                            <label class="form-check-label"
                                                   for="pinta_schema_org_select_time_day">
                                                <?php echo $colum_select_place_time_day ; ?>
                                            </label>
                                        </td>
                                        <td>
                                            <input type="text" class="form-control day" name="pinta_schema_org_select_time_full[0][day]"
                                                   value="<?php if(!empty($pinta_schema_org_select_time_full[0]['day'])){ echo $pinta_schema_org_select_time_full[0]['day'] ; }?>" placeholder="<?php echo $placeholder_day ; ?>" >
                                        </td>
                                        <td>
                                            <label class="form-check-label"
                                                   for="pinta_schema_org_select_time[time]">
                                                <?php echo $colum_select_place_time_time ; ?>
                                            </label>
                                        </td>
                                        <td>
                                            <input type="text"  class="form-control time" name="pinta_schema_org_select_time_full[0][time]"
                                                   value="<?php if(!empty($pinta_schema_org_select_time_full[0]['time'])} $pinta_schema_org_select_time_full[0]['time'] ; }?>" placeholder="<?php echo $placeholder_time ; ?>">
                                        </td>
                                        <td>
                                            <a class="add_time btn btn-primary">+</a>
                                        </td>
                                        <td>

                                        </td>
                                    </tr>
                                  {else}
                                    <?php $in = 0 ; ?>
                                    <?php  foreach( $pinta_schema_org_select_time_full as $index  ) { ?>
                                    <tr class="time-tr">
                                        <td>
                                            <label class="form-check-label"
                                                   for="pinta_schema_org_select_time_day">
                                                <?php echo $colum_select_place_time_day ; ?>
                                            </label>
                                        </td>
                                        <td>

                                            <input type="text"  class="form-control day" name="pinta_schema_org_select_time_full[<?php echo $in ; ?>][day]"
                                                   value="<?php echo $index['day'] ; ?>" placeholder="<?php echo $placeholder_day ; ?>">
                                        </td>
                                        <td>
                                            <label class="form-check-label"
                                                   for="pinta_schema_org_select_time[time]">
                                                <?php echo $colum_select_place_time_time ; ?>
                                            </label>
                                        </td>
                                        <td>


                                            <input type="text"  class="form-control time" name="pinta_schema_org_select_time_full[<?php echo $in ; ?>][time]"
                                                   value="<?php echo $index['time'] ; ?>" placeholder="<?php echo $placeholder_time ; ?>">
                                        </td>
                                        <td>
                                            <a class="add_time btn btn-primary">+</a>
                                        </td>
                                        <td>
                                            <?php if( $in != 0){ ?>
                                            <a class="delete_time btn btn-danger">-</a>
                                            <?php  } ?>
                                        </td>
                                    </tr>
                                    <?php $in = $in +1; ?>
                                    <?php  } ?>
                                    {/if}

                                </table>

                            </div>
                        </div>
                    </form>
                </div>
            </div>



            <div class="optionsform">
                <div class="row" style="width: 100%;">
                    <div class="col-sm-2">
                        <button id="update" class="btn btn-default pull-left">
                            <i class="process-icon-save"></i>
                            Save
                        </button>
                    </div>
                </div>
            </div>

    <script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
    <script type="application/javascript">

        $('div.alert button.close').on('click', function () {
            $(this).closest("div.alert").css("display", "none");
        });

        function showSuccessAlert()
        {
            $("div.alert").css("display", "none");
            $("div.alert-success").css("display", "block").delay(3000).fadeOut('slow');
        }

        function showWarningAlert1()
        {
            $("div.alert").css("display", "none");
            $("div.alert-warning1").css("display", "block").delay(3000).fadeOut('slow');
        }
        function showWarningAlert2()
        {
            $("div.alert").css("display", "none");
            $("div.alert-warning2").css("display", "block").delay(3000).fadeOut('slow');
        }
        function showWarningAlert3()
        {
            $("div.alert").css("display", "none");
            $("div.alert-warning3").css("display", "block").delay(3000).fadeOut('slow');
        }
        function showWarningAlert4()
        {
            $("div.alert").css("display", "none");
            $("div.alert-warning4").css("display", "block").delay(3000).fadeOut('slow');
        }
        var change =  new Array();
        var field ='';
        var id ="";
        $("select").on("change",function () {
            change.push($(this).attr('id'));

        });
        $("input[type='checkbox']").on("click",function () {

            if ($(this).prop('checked')) {

                $(this).attr("checked","checked");
                $(this).val(1);
            } else {
                $(this).removeAttr("checked");
                $(this).val(0);
            }
            change.push($(this).attr('id'));

        });

        $("#update").on("click",function () {
            console.log(change.length)
            if(change.length > 0){
            for(var i=0;i < change.length;i++){
                field = $("#"+change[i]).val();
                id =change[i];
                console.log("field="+field+"; id="+id);
                $.ajax({
                    type: 'POST',
                    url: '/modules/pinta_schemaorg/ajax.php',
                    data: 'method=update&field=' + field +'&id='+id,
                    dataType: 'json',
                    success: function () {
                        showSuccessAlert();
                        var destination = $("div.alert-success").offset().top - 150;
                        $('html').animate({ scrollTop: destination }, 1100);
                    },
                    error: function () {
                        showWarningAlert1();//Re-update google categories link
                        var destination = $("div.alert-warning1").offset().top - 150;
                        $('html').animate({ scrollTop: destination }, 1100);
                    }
                });
                field = '';

            }
           // location.reload();

            } else {
                showWarningAlert1();//Re-update google categories link
                var destination = $("div.alert-warning1").offset().top - 150;
                $('html').animate({ scrollTop: destination}, 1100);
            }
        });
    </script>
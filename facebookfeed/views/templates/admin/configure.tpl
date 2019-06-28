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
</style>
<div class="module_confirmation conf confirm alert alert-success">
    <button type="button" class="close">×</button>
    The settings have been updated.
</div>

<div class="module_confirmation conf confirm alert alert-warning1">
    <button type="button" class="close">×</button>
    Saving error.Re-update google categories link
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
        {l s='SETTINGS' mod='facebookfeed'}
    </h3>

    <div>

        <div class="optionsform">
            <div class="row">
                <label class="col-sm-2 control-label">
                    <span data-toggle="tooltip" title="Select the currency type of your goods">Currency</span>
                </label>
                <div class="col-sm-2">
                    <ps-select name="facebookfeedproducts_currency" data-type="currency" style="width: 100%;">
                        {foreach from=$currencies item=currency}
                            <option value="{$currency.iso_code|escape:'htmlall':'UTF-8'}"  {if $currency.iso_code == $options['currentCurrency']} selected="selected" {/if} >{$currency.name|escape:'htmlall':'UTF-8'}</option>
                        {/foreach}
                    </ps-select>
                </div>
            </div>
        </div>

        <div class="optionsform">
            <div class="row">
                <label class="col-sm-2 control-label">
                    <span data-toggle="tooltip" title="Select the language of the products  in the feed according to the language of the products on your site">Language</span>
                </label>
                <div class="col-sm-2">
                    <ps-select name="facebookfeedproducts_language" data-type="language" style="width: 100%;">
                        {foreach from=$languages item=language}
                            <option value="{$language.id_lang|escape:'htmlall':'UTF-8'}"  {if $language.id_lang == $options['currentLanguage']} selected="selected" {/if} >{$language.name|escape:'htmlall':'UTF-8'}</option>
                        {/foreach}
                    </ps-select>
                </div>
            </div>
        </div>

        <div class="optionsform">
            <div class="row">
                <label class="col-sm-2 control-label">
                    <span data-toggle="tooltip" title="Google Options">Options</span>
                </label>
                <div class="col-sm-2" style="text-align: center">
                    <label class="control-label">
                    <span data-toggle="tooltip"
                          title="Please select matching options on your website with Google options">
                        Select matching
                    </span>
                    </label>

                </div>
            </div>
        </div>

        <div class="optionsform">
            <div class="row">
                <label class="col-sm-2 control-label">Color</label>
                <div class="col-sm-2">
                    <ps-select name="facebookfeedproducts_color" data-type="color" style="width: 100%;">
                        <option disabled>Select options for Color</option>
                        {foreach from=$attributes item=attribute}
                            <option value="{$attribute.id_attribute_group|escape:'htmlall':'UTF-8'}"  {if $attribute.id_attribute_group == $options['currentColor']} selected="selected" {/if} >{$attribute.name|escape:'htmlall':'UTF-8'}</option>
                        {/foreach}
                    </ps-select>
                </div>
            </div>
        </div>

        <div class="optionsform">
            <div class="row">
                <label class="col-sm-2 control-label">Size</label>
                <div class="col-sm-2">
                    <ps-select name="facebookfeedproducts_size" data-type="size" style="width: 100%;">
                        <option value="">Select options for Size</option>
                        {foreach from=$attributes item=attribute}
                            <option value="{$attribute.id_attribute_group|escape:'htmlall':'UTF-8'}"  {if $attribute.id_attribute_group == $options['currentSize']} selected="selected" {/if} >{$attribute.name|escape:'htmlall':'UTF-8'}</option>
                        {/foreach}
                    </ps-select>
                </div>
            </div>
        </div>

        <div class="optionsform">
            <div class="row">
                <label class="col-sm-2 control-label">Pattern</label>
                <div class="col-sm-2">
                    <ps-select name="facebookfeedproducts_pattern" data-type="pattern" style="width: 100%;">
                        <option value="">Select options for Pattern</option>
                        {foreach from=$attributes item=attribute}
                            <option value="{$attribute.id_attribute_group|escape:'htmlall':'UTF-8'}"  {if $attribute.id_attribute_group == $options['currentPattern']} selected="selected" {/if} >{$attribute.name|escape:'htmlall':'UTF-8'}</option>
                        {/foreach}
                    </ps-select>
                </div>
            </div>
        </div>

        <div class="optionsform">
            <div class="row">
                <label class="col-sm-2 control-label">Material</label>
                <div class="col-sm-2">
                    <ps-select name="facebookfeedproducts_material"  data-type="material" style="width: 100%;">
                        <option value="">Select options for Material</option>
                        {foreach from=$attributes item=attribute}
                            <option value="{$attribute.id_attribute_group|escape:'htmlall':'UTF-8'}"  {if $attribute.id_attribute_group == $options['currentMaterial']} selected="selected" {/if} >{$attribute.name|escape:'htmlall':'UTF-8'}</option>
                        {/foreach}
                    </ps-select>
                </div>
            </div>
        </div>

        <div class="optionsform">
            <div class="row" style="width: 100%;">
                <label class="col-sm-2 control-label">
                    <span data-toggle="tooltip" title="Update google categories">Update google categories</span>
                </label>
                <div class="col-sm-8">
                    <input type="text" id="link-update" name="link-update" placeholder="https://www.google.com/basepages/producttype/taxonomy-with-ids.en-US.txt">
                </div>
            </div>
        </div>

    </div>

    <div style="word-break: break-word;padding: 5px; width:100%; display:inline-block;">

        <form method="POST" id="postform" action="/index.php?fc=module&module=facebookfeed&controller=general" target="_blank">

            {if $categories}
                {if $googlemaincategories}

                    <div class="row">
                        <div class="col-sm-2">
                            <label class="col-sm-12 control-label">
                                <span data-toggle="tooltip" title="Category on your site">Category on your site</span>
                            </label>
                        </div>
                        <div class="col-sm-2">
                            <label class="col-sm-12 control-label text-rigth">
                                <span data-toggle="tooltip" title="Google category. Please select the closest match to your category on website">Google category</span>
                            </label>
                        </div>
                        <div class="col-sm-8">
                            <label class="col-sm-12 control-label">
                                <span data-toggle="tooltip" title="Google  subcategory. Please select for more exact match to your website category  and category on Facebook">Google  subcategory</span>
                            </label>
                        </div>
                    </div>

                    {foreach from=$categories item=category}
                        {$categ=''}
                        <div class="row">
                            <div class="col-sm-2" style="padding: 5px;">
                                {$category.name|escape:'htmlall'}
                            </div>
                            <div class="col-sm-2" style="padding: 5px;">
                                <ps-select class="googlemaincategories" name="googlemaincategory_{$category.categoryId|escape:'htmlall':'UTF-8'}" data-int="{$category.categoryId|escape:'htmlall':'UTF-8'}" style="width: 100%;">
                                    <option value="">Select...</option>
                                    {foreach from=$googlemaincategories item=googlemaincategory}
                                        <option value="{$googlemaincategory.google_category_id|escape:'htmlall':'UTF-8'}" {if $googlemaincategory.google_category_id == $category.googleCategoryId} selected="selected" {$categ=$googlemaincategory.google_category_id} {/if} >
                                            {html_entity_decode($googlemaincategory.google_category_name|escape:'htmlall':'UTF-8')}
                                        </option>
                                    {/foreach}
                                </ps-select>
                            </div>
                            <div class="col-sm-8  max-bottom-ul" style="    padding-top: 5px;">
                                <input type='text' style="width: 100%;"
                                       name="googlecategory_{$category.categoryId|escape:'htmlall':'UTF-8'}"
                                       data-int="{if $categ}{$categ|escape:'htmlall':'UTF-8'}{/if}"
                                       data-category_id="{if $category.categoryId}{$category.categoryId|escape:'htmlall':'UTF-8'}{/if}"
                                       value="{html_entity_decode($category.googleCategoryName|escape:'htmlall':'UTF-8')}" {if !$categ} disabled {/if} >
                            </div>
                        </div>
                    {/foreach}

                {/if}
            {/if}
        </form>

    </div>

    <div class="optionsform">
        <div class="row" style="width: 100%;">
            <div class="col-sm-2">
                <a href="javascript:;" id="save-data" class="btn btn-default pull-left">
                    <i class="process-icon-save"></i>
                    Save
                </a>
            </div>
        </div>
    </div>

    <div id="block-buttons">
        <button id="btn_for_trigger" type="button"  data-toggle="modal" data-target="#exampleModal"></button>
        <button type="submit" id="download_button" class="btn btn-primary">Get a list of products</button>
    </div>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">FACEBOOK FEED PRODUCT</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <a href="/modules/facebookfeed/facebookfeed.xml" target="_blank" class="btn btn-primary btn_get_xml">Go to XML</a>
            </div>
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

    $('#download_button').on('click', function () {
        var categories = new Array();
        $("ps-select.googlemaincategories").each(function() {
            if($(this).find('select').val() != '')
                categories.push($(this).data('int'));
        });
        $.ajax({
            type: 'POST',
            url: '/modules/facebookfeed/ajax.php',
            data: {
                method: 'number_of_products',
                categories: categories
            },
            dataType: 'json',
            success: function (data) {
                if(data == true){
                    $("div.modal-body").html('Facebook Feed sucessfully created <a href="' + window.location.protocol+ '//' + window.location.host + '/modules/facebookfeed/facebookfeed.xml" target="_blank">' + window.location.protocol+ '//' + window.location.host + '/modules/facebookfeed/facebookfeed.xml</a>');
                    $(".btn_get_xml").css("display", "unset");
                    $( "#btn_for_trigger" ).trigger( "click" );
                }else if(data == false){
                    $("div.modal-body").html("Facebook Feed not created");
                    $(".btn_get_xml").css("display", "none");
                    $( "#btn_for_trigger" ).trigger( "click" );
                }
            }
        });

    });

    $( document ).ready(function() {
        var arr = $('select[name^=googlemaincategory]');
        var a = 0;
        for (var i = 0; i < arr.length; i++) {
            let item = arr[i];
            if (item.value) {
                a++;
            }
        }

        if (a) {
            $('#download_button, #block-buttons').show();
        } else {
            $('#download_button, #block-buttons').hide();
        }
    });

    $('#save-data').on('click', function () {
        var link = $('#link-update').val();
        var description = $('#site-description').val();

        $.ajax({
            type: 'POST',
            url: '/modules/facebookfeed/ajax.php',
            data: 'method=update&link=' + link + '&description=' + description,
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

    });

    $('ps-select[name^=facebookfeedproducts]').change(function () {
        var value = $('option:selected', this).val();
        var type = $(this).data('type');
        $.ajax({
            type: 'POST',
            url: '/modules/facebookfeed/ajax.php',
            data: 'method='+ type +'&'+type+'=' + value,
            dataType: 'json',
            success: function () {
                showSuccessAlert();
            },
            error: function () {
                showWarningAlert2(); //Re-select options
            }
        });
    });

    $('ps-select[name^=googlemaincategory]').change(function () {
        var button = $(this);
        var google_main_category_id = $('option:selected', this).val();
        var category_id = button.attr('data-int');
        button.prop('disabled', true);
        $.ajax({
            type: 'POST',
            url: '/modules/facebookfeed/ajax.php',
            data: 'method=saveCategories&google_main_category_id=' + google_main_category_id + '&category_id=' + category_id,
            dataType: 'json',
            success: function () {

            },
            complete: function () {
                button.prop('disabled', false);
                $('input[name=googlecategory_' + category_id + ']').val('');
                $('input[name=googlecategory_' + category_id + ']').attr('data-int', google_main_category_id);
                $('input[name=googlecategory_' + category_id + ']').prop('disabled', false);
                if (google_main_category_id == "") {
                    $('input[name=googlecategory_' + category_id + ']').prop('disabled', true);
                }
                arr = $('select[name^=googlemaincategory]');
                a = 0;
                for (var i = 0; i < arr.length; i++) {
                    let item = arr[i];
                    if (item.value) {
                        a++;
                    }
                }

                if (a) {
                    $('#download_button, #block-buttons').show();
                } else {
                    $('#download_button, #block-buttons').hide();
                }
                showSuccessAlert();
            },
            error: function () {
                showWarningAlert3(); //Re-select google categories
            }
        });
    });

    var name;
    var category_id;
    $('input[name^=googlecategory]').autocomplete({
        minLength: 0,
        source: function (request, response) {
            var filter_id = $(this.element).attr("data-int");
            name = $(this.element).prop("name");
            category_id = $(this.element).attr("data-category_id");
            $.ajax({
                type: 'POST',
                url: '/modules/facebookfeed/ajax.php',
                data: 'method=autocomplete&filter_name=' + encodeURIComponent(request.term) + '&filter_id=' + filter_id,
                dataType: 'json',
                success: function (json) {
                    response($.map(json, function (item) {
                        return {
                            label: item['google_category_name'],
                            value: item['google_category_id']
                        }
                    }));
                }
            });
        },
        select: function (event, item) {
            $.ajax({
                type: 'POST',
                url: '/modules/facebookfeed/ajax.php',
                data: 'method=saveCategories&google_category_id=' + item.item.value + '&category_id=' + category_id,
                dataType: 'json',
                success: function () {
                },
                complete: function () {
                    $('input[name=' + name + ']').prop('value', item.item.label);
                    showSuccessAlert();
                },
                error: function () {
                    showWarningAlert4();//Re-select google subcategories
                }
            });


            return false;
        },
        focus: function (item) {
            return true;
        }
    }).focus(function() {
        $(this).autocomplete('search', $(this).val())
    });

</script>
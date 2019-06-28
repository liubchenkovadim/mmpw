<li>
    <a href="{$base_dir}modules/pinta_schemaorg/pinta_schemaorg.php" title="{l s='Click this link' mod='pinta_schemaorg'}">{l s='Click me!' mod='pinta_schemaorg'}</a>
</li>
<!-- Block mymodule -->
<div id="pinta_schemaorg_block_left" class="block">
    <h4>{l s='Welcome!' mod='pinta_schemaorg'}</h4>
    <div class="block_content">
        <p>
            {if !isset($my_module_name) || !$my_module_name}
                {capture name='pinta_schemaorg_tempvar'}{l s='World' mod='pinta_schemaorg'}{/capture}
                {assign var='pinta_schemaorg_name' value=$smarty.capture.my_module_tempvar}
            {/if}
            {l s='Hello %1$s!' sprintf=$my_module_name mod='pinta_schemaorg'}
        </p>
        <ul>
            <li><a href="{$my_module_link}"  title="{l s='Click this link' mod='pinta_schemaorg'}">{l s='Click me!' mod='pinta_schemaorg'}</a></li>
        </ul>
    </div>
</div>
<!-- /Block mymodule -->
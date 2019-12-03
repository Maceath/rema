{block name="frontend_listing_product_box_button_buy"}

    {block name="frontend_listing_product_box_button_buy_url"}
        {$url = {url controller=checkout action=addArticle} }
    {/block}

    {block name="frontend_listing_product_box_button_buy_form"}
        <form name="sAddToBasket"
              method="post"
              action="{$url}"
              class="buybox--form"
              data-add-article="true"
              data-eventName="submit"
              {if $theme.offcanvasCart}
              data-showModal="false"
              data-addArticleUrl="{url controller=checkout action=ajaxAddArticleCart}"
              {/if}>

            {block name="frontend_listing_product_box_button_buy_order_number"}
                <input type="hidden" name="sAdd" value="{$sArticle.ordernumber}"/>
            {/block}
            
            {* Quantity selection *}
                            {block name='frontend_detail_buy_quantity'}
                                <div class="buybox--quantity block">
                                    {$maxQuantity=$sArticle.maxpurchase+1}
                                    {if $sArticle.laststock && $sArticle.instock < $sArticle.maxpurchase}
                                        {$maxQuantity=$sArticle.instock+1}
                                    {/if}

                                    {block name='frontend_detail_buy_quantity_select'}
                                        <div class="select-field">
                                            <select id="sQuantity" name="sQuantity" class="quantity--select">
                                                {section name="i" start=$sArticle.minpurchase loop=$maxQuantity step=$sArticle.purchasesteps}
                                                    <option value="{$smarty.section.i.index}">{$smarty.section.i.index}{if $sArticle.packunit} {$sArticle.packunit}{/if}</option>
                                                {/section}
                                            </select>
                                        </div>
                                    {/block}
                                </div>
                            {/block}

            {block name="frontend_listing_product_box_button_buy_button"}
                <button class="buybox--button block btn is--primary is--icon-right is--center is--large">
                    {block name="frontend_listing_product_box_button_buy_button_text"}
                        {s namespace="frontend/listing/box_article" name="ListingBuyActionAdd"}{/s}<i class="icon--basket"></i> <i class="icon--arrow-right"></i>
                    {/block}
                </button>
            {/block}
        </form>
    {/block}
{/block}

<?php
/**
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
 */

require_once(dirname(__FILE__).'../../../config/config.inc.php');
require_once(dirname(__FILE__).'../../../init.php');

if (Configuration::get('PS_TOKEN_ENABLE') == 1 && strcmp(Tools::getToken(false), Tools::getValue('token'))) {
    switch (Tools::getValue('method')) {
        case 'saveCategories':
            $post = $_POST;
            if (isset($post["google_main_category_id"])) {
                $data = array(
                    'category_id' => $post["category_id"],
                    'google_main_category_id' => $post['google_main_category_id'],
                    'google_category_id' => false
                );
            } else {
                $data = array(
                    'category_id' => $post["category_id"],
                    'google_main_category_id' => false,
                    'google_category_id' => $post['google_category_id']
                );
            }

            saveGoogleCategory($data);
            break;

        case 'autocomplete':
            $json = array();
            $post = $_POST;

            if (isset($post['filter_name'])) {
                $filterName = $post['filter_name'];

                $data = array(
                    'google_category_name' => ($filterName != '--select--') ? $filterName : '',
                    'google_category_id' => $post['filter_id']
                );

                $json[] = array(
                    'google_category_id' => 0,
                    'google_category_name' => '--select--'
                );

                $results = getGoogleCategories($data);
                foreach ($results as $result) {
                    $json[] = array(
                        'google_category_id' => $result['google_category_id'],
                        'google_category_name' =>
                            strip_tags(html_entity_decode($result['google_category_name'], ENT_QUOTES, 'UTF-8'))
                    );
                }
            }

            echo Tools::jsonEncode($json);
            break;

        case 'currency':
            $post = $_POST;
            $currency = ($post['currency']) ? $post['currency'] : '';
            Configuration::updateValue('currency_facebook_feed', $currency);

            break;

        case 'language':
            $post = $_POST;
            $language = ($post['language']) ? $post['language'] : '';
            Configuration::updateValue('language_facebook_feed', $language);

            break;

        case 'color':
            $post = $_POST;
            $color = ($post['color']) ? $post['color'] : '';
            Configuration::updateValue('color_facebook_feed', $color);

            break;

        case 'pattern':
            $post = $_POST;
            $color = ($post['pattern']) ? $post['pattern'] : '';
            Configuration::updateValue('pattern_facebook_feed', $color);

            break;

        case 'material':
            $post = $_POST;
            $color = ($post['material']) ? $post['material'] : '';
            Configuration::updateValue('material_facebook_feed', $color);

            break;

        case 'size':
            $post = $_POST;
            $size = ($post['size']) ? $post['size'] : '';
            Configuration::updateValue('size_facebook_feed', $size);

            break;

        case 'update':
            $post = $_POST;

            if (isset($post['description']) && !empty($post['description'])) {
                Configuration::updateValue('site_description_facebook_feed', $post['description']);
            }

            if (isset($post['link']) && !empty($post['link'])) {
                $link = $post['link'];
                if ($listCategories = file($link)) {
                    foreach ($listCategories as $category) {
                        if (!strstr($category, '#')) {
                            $buffer = explode("-", $category);
                            $google_category_name = htmlentities(trim($buffer[1]));
                            $google_category_id = trim($buffer[0]);
                            $google_category_parent = 0;
                            if (count($buffer1 = explode(">", $buffer[1])) > 1) {
                                $parent = getGoogleCategoryByName(htmlentities(trim($buffer1[0])));
                                $google_category_parent = $parent["google_category_id"];
                            }

                            $data = array(
                                'google_category_id' => $google_category_id,
                                'google_category_name' => $google_category_name,
                                'google_category_parent' => $google_category_parent
                            );
                            updateGoogleCategories($data);
                        }
                    }
                }
            }

            break;

        case 'number_of_products':
            $post = $_POST;
            $categories = $post['categories'];
            $number_of_products = getNumberOfProducts($categories);
            if (array_shift($number_of_products) > 0) {
                Generate();
                echo 'true';
            } else {
                echo 'false';
            }
            break;

        default:
            exit;
    }
}
function getNumberOfProducts($categories)
{
    $cats = implode(",", $categories);
    $q = "SELECT COUNT(`id_product`) FROM `" . _DB_PREFIX_ . "product` WHERE `id_category_default` in (" . pSQL($cats) . ")";
    $response = Db::getInstance()
        ->executes($q);

    return array_shift($response);
}


function updateGoogleCategories($data)
{
    Db::getInstance()
        ->execute("INSERT INTO " . _DB_PREFIX_ . "google_product_category SET google_category_id = '" .
            (int)$data['google_category_id'] . "', google_category_name = '" .
            pSQL($data['google_category_name']) . "', google_category_parent = '" .
            (int)$data['google_category_parent'] . "'");
}

function getGoogleCategoryByName($categoryName)
{
    $response = Db::getInstance()
        ->executes("SELECT * FROM " . _DB_PREFIX_ . "google_product_category WHERE google_category_name = '" .
            pSQL($categoryName) . "'");

    if (is_array($response)) {
        return array_shift($response);
    }
}

function saveGoogleCategory($data)
{
    if ($data['google_main_category_id'] != 0) {
        Db::getInstance()
            ->execute("DELETE FROM " . _DB_PREFIX_ . "google_category WHERE category_id = '" .
                (int)$data['category_id'] . "'");
        Db::getInstance()
            ->execute("INSERT INTO " . _DB_PREFIX_ . "google_category SET category_id = '" .
                (int)pSQL($data['category_id']) . "', google_main_category_id = '" .
                (int)pSQL($data['google_main_category_id']) . "'");
    } elseif ($data['google_category_id'] !=0) {
        Db::getInstance()
            ->execute("UPDATE " . _DB_PREFIX_ . "google_category SET google_category_id = '" .
                (int)$data['google_category_id'] . "' WHERE category_id = '" .
                (int)$data['category_id'] . "'");
    } else {
        Db::getInstance()
            ->execute("DELETE FROM " . _DB_PREFIX_ . "google_category WHERE category_id = '" .
                (int)$data['category_id'] . "'");
    }
}

function getGoogleCategories($data)
{
    $query = Db::getInstance()
        ->executes("SELECT * FROM " . _DB_PREFIX_ . "google_product_category WHERE google_category_parent = '" .
            (int)$data['google_category_id'] . "' AND (google_category_name LIKE '%" .
            pSQL($data['google_category_name']) . "%' OR google_category_id LIKE '" .
            pSQL($data['google_category_name']) . "%')");

    return $query;
}

function Generate()
{
    $site_url = Tools::getHttpHost(true).__PS_BASE_URI__;
    $textDescription = Configuration::get('site_description_facebook_feed') ?: '';

    $context = Context::getContext();

    $langId = $context->language->id;
    if (!empty((int)Configuration::get('language_facebook_feed'))) {
        $langId = (int)Configuration::get('language_facebook_feed');
    }

    $products = Product::getProducts($langId, 0, 5000, 'id_product', 'ASC');
    $dom = new DomDocument('1.0');
    $rss = $dom->appendChild($dom->createElement('rss'));
    $rss->setAttributeNS('http://www.w3.org/2000/xmlns/', 'xmlns:g', 'http://base.google.com/ns/1.0');
    $channel = $rss->appendChild($dom->createElement('channel'));

    $title = $channel->appendChild($dom->createElement('title'));
    $title->appendChild($dom->createTextNode(Configuration::get('PS_SHOP_NAME')));
    $link = $channel->appendChild($dom->createElement('link'));
    $link->appendChild($dom->createTextNode($site_url));
    $description = $channel->appendChild($dom->createElement('description'));
    $description->appendChild($dom->createTextNode($textDescription));
    foreach ($products as $product) {
        $category = new Category($product['id_category_default'], (int)Context::getContext()->language->id);
        $google_category_ids = getGoogleCategorysByCategoryId($category->id_category);
        if (!empty($google_category_ids)) {
            $item = $channel->appendChild($dom->createElement('item'));
            $g_id = $item->appendChild($dom->createElement('g:id'));
            $g_id->appendChild($dom->createTextNode($product['id_product']));
            $g_title = $item->appendChild($dom->createElement('g:title'));
            $g_title->appendChild($dom->createTextNode($product['name']));
            $g_description = $item->appendChild($dom->createElement('g:description'));
            $prod_desc = strip_tags(html_entity_decode($product['description']));
            $g_description->appendChild($dom->createTextNode($prod_desc));

            $product_url = '/index.php?controller=product&id_product=' . $product['id_product'];
            $product_link = $site_url . $product_url;

            $g_link = $item->appendChild($dom->createElement('g:link'));
            $g_link->appendChild($dom->createTextNode($product_link));

            $link = new Link();
            $image = Product::getCover((int)$product['id_product']);
            $image = new Image($image['id_image']);
            $product_photo = _PS_BASE_URL_ . _THEME_PROD_DIR_ . $image->getExistingImgPath() . ".jpg";

            $g_image_link = $item->appendChild($dom->createElement('g:image_link'));
            $g_image_link->appendChild($dom->createTextNode($product_photo));
            $g_brand = $item->appendChild($dom->createElement('g:brand'));
            $g_brand->appendChild($dom->createTextNode($product['manufacturer_name']));
            $g_condition = $item->appendChild($dom->createElement('g:condition'));
            $g_condition->appendChild($dom->createTextNode($product['condition']));
            $g_availability = $item->appendChild($dom->createElement('g:availability'));
            $g_availability->appendChild($dom->createTextNode($product['available_now']));

            $currencyCode = $context->currency->iso_code;
            if (!empty($currency = Configuration::get('currency_facebook_feed'))) {
                $currencyCode = $currency;
            }

            $g_price = $item->appendChild($dom->createElement('g:price'));
            $g_price->appendChild($dom->createTextNode(round($product['price'], 2) . ' '. $currencyCode));

            if ($google_category_ids["google_category_id"]) {
                $google_category = $google_category_ids["google_category_id"];
            } else {
                $google_category = $google_category_ids["google_main_category_id"];
            }

            $g_google_product_category = $item->appendChild($dom->createElement('g:google_product_category'));
            $g_google_product_category->appendChild($dom->createTextNode($google_category));
            $g_custom_label_0 = $item->appendChild($dom->createElement('g:custom_label_0'));
            $g_custom_label_0->appendChild($dom->createTextNode(''));


            $productInfo = new Product($product['id_product'], $context->language->id);
            $attributes = $productInfo->getAttributeCombinations($context->language->id);

            $listAttributes = array();

            foreach ($attributes as $attribute) {
                if ((
                        $attribute['id_attribute_group'] == Configuration::get('color_facebook_feed') ||
                        $attribute['id_attribute_group'] == Configuration::get('size_facebook_feed') ||
                        $attribute['id_attribute_group'] == Configuration::get('material_facebook_feed') ||
                        $attribute['id_attribute_group'] == Configuration::get('pattern_facebook_feed')
                    ) && !in_array($attribute['group_name'], $listAttributes)) {
                    $listAttributes[] = $attribute['group_name'];

                    $name = 'g:'.$attribute['group_name'];
                    $option = $item->appendChild($dom->createElement(str_replace(' ', '_', $name)));
                    $option->appendChild($dom->createTextNode($attribute['attribute_name']));
                }
            }
        }
    }
    $dom->formatOutput = true;
    $dom->save('facebookfeed.xml');
}

function getGoogleCategorysByCategoryId($category_id)
{
    $query = Db::getInstance()
        ->executes("SELECT * FROM " . _DB_PREFIX_ . "google_category WHERE category_id = '" .
            (int)$category_id . "'");

    if (count($query)) {
        return array_shift($query);
    }
    return '';
}

exit();

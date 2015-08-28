<?php

class ControllerCommonHeader extends Controller {

    public function index() {
        $data['title'] = $this->document->getTitle();

        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }

        $data['base'] = $server;
        $data['description'] = $this->document->getDescription();
        $data['keywords'] = $this->document->getKeywords();
        $data['links'] = $this->document->getLinks();
        $data['styles'] = $this->document->getStyles();
        $data['scripts'] = $this->document->getScripts();
        $data['lang'] = $this->language->get('code');
        $data['direction'] = $this->language->get('direction');

        if ($this->config->get('config_google_analytics_status')) {
            $data['google_analytics'] = html_entity_decode($this->config->get('config_google_analytics'), ENT_QUOTES, 'UTF-8');
        } else {
            $data['google_analytics'] = '';
        }

        $data['name'] = $this->config->get('config_name');

        if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
            $data['icon'] = $server . 'image/' . $this->config->get('config_icon');
        } else {
            $data['icon'] = '';
        }

        if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
            $data['logo'] = $server . 'image/' . $this->config->get('config_logo');
        } else {
            $data['logo'] = '';
        }

        $this->load->language('common/header');

        $data['text_home'] = $this->language->get('text_home');
        $data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
        $data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
        $data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', 'SSL'), $this->customer->getFirstName(), $this->url->link('account/logout', '', 'SSL'));

        $data['text_account'] = $this->language->get('text_account');
        $data['text_register'] = $this->language->get('text_register');
        $data['text_login'] = $this->language->get('text_login');
        $data['text_order'] = $this->language->get('text_order');
        $data['text_transaction'] = $this->language->get('text_transaction');
        $data['text_download'] = $this->language->get('text_download');
        $data['text_logout'] = $this->language->get('text_logout');
        $data['text_checkout'] = $this->language->get('text_checkout');
        $data['text_category'] = $this->language->get('text_category');
        $data['text_all'] = $this->language->get('text_all');
        $data['text_reward'] = $this->language->get('text_reward');
        $data['text_freeshipping'] = $this->language->get('text_freeshipping');
        $data['text_flashsale'] = $this->language->get('text_flashsale');
        
        $data['text_search_shortcut1'] = $this->language->get('text_search_shortcut1');
        $data['text_search_shortcut2'] = $this->language->get('text_search_shortcut2');
        $data['text_search_shortcut3'] = $this->language->get('text_search_shortcut3');
        $data['text_search_shortcut4'] = $this->language->get('text_search_shortcut4');
        $data['text_search_shortcut5'] = $this->language->get('text_search_shortcut5');
        $data['text_search_shortcut6'] = $this->language->get('text_search_shortcut6');

        $data['home'] = $this->url->link('common/home');
        $data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
        $data['logged'] = $this->customer->isLogged();
        $data['account'] = $this->url->link('account/account', '', 'SSL');
        $data['register'] = $this->url->link('account/register', '', 'SSL');
        $data['login'] = $this->url->link('account/login', '', 'SSL');
        $data['order'] = $this->url->link('account/order', '', 'SSL');
        $data['transaction'] = $this->url->link('account/transaction', '', 'SSL');
        $data['download'] = $this->url->link('account/download', '', 'SSL');
        $data['logout'] = $this->url->link('account/logout', '', 'SSL');
        $data['shopping_cart'] = $this->url->link('checkout/cart');
        $data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
        $data['contact'] = $this->url->link('information/contact');
        $data['telephone'] = $this->config->get('config_telephone');

        $data['reward'] = $this->url->link('account/reward', '', 'SSL');

        $data['text_contact'] = $this->language->get('text_contact');

        $status = true;

        if (isset($this->request->server['HTTP_USER_AGENT'])) {
            $robots = explode("\n", str_replace(array("\r\n", "\r"), "\n", trim($this->config->get('config_robots'))));

            foreach ($robots as $robot) {
                if ($robot && strpos($this->request->server['HTTP_USER_AGENT'], trim($robot)) !== false) {
                    $status = false;

                    break;
                }
            }
        }

        //get name
        $this->load->model('account/customer');

        if ($this->request->server['REQUEST_METHOD'] != 'POST') {
            $customer_info = $this->model_account_customer->getCustomer($this->customer->getId());
        }

        if (isset($this->request->post['firstname'])) {
            $data['firstname'] = $this->request->post['firstname'];
        } elseif (!empty($customer_info)) {
            $data['firstname'] = $customer_info['firstname'];
        } else {
            $data['firstname'] = '购乐吧er';
        }

        //get 4 pictures
        $data["picTitle1"] = explode("|", ($this->config->get('categorypictures_image1title')));
        $data["picTitle2"] = explode("|", ($this->config->get('categorypictures_image2title')));
        $data["picTitle3"] = explode("|", ($this->config->get('categorypictures_image3title')));
        $data["picTitle4"] = explode("|", ($this->config->get('categorypictures_image4title')));
        
        $data['lang_code'] = $this->language->get('code');
        if ($data['lang_code'] === 'en') {
            $image1title_en = $this->config->get('categorypictures_image1title_en');
            if (!empty($image1title_en)) {
                $data['picTitle1'] = explode("|", $image1title_en);
            }
            $image2title_en = $this->config->get('categorypictures_image2title_en');
            if (!empty($image2title_en)) {
                $data['picTitle1'] = explode("|", $image2title_en);
            }
            $image3title_en = $this->config->get('categorypictures_image3title_en');
            if (!empty($image3title_en)) {
                $data['picTitle1'] = explode("|", $image3title_en);
            }
            $image4title_en = $this->config->get('categorypictures_image4title_en');
            if (!empty($image4title_en)) {
                $data['picTitle1'] = explode("|", $image4title_en);
            }
        }

        // Menu
        $this->load->model('catalog/category');

        $this->load->model('catalog/product');

        $data['categories'] = array();

        $categories = $this->model_catalog_category->getCategories(0);

        foreach ($categories as $category) {
            if ($category['top']) {
                // Level 2
                $children_data = array();

                $children = $this->model_catalog_category->getCategories($category['category_id']);

                foreach ($children as $child) {
                    $filter_data = array(
                        'filter_category_id' => $child['category_id'],
                        'filter_sub_category' => true
                    );

                    $children_data[] = array(
                        'name' => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                        'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
                    );
                }

                // Level 1
                $data['categories'][] = array(
                    'name' => $category['name'],
                    'children' => $children_data,
                    'column' => $category['column'] ? $category['column'] : 1,
                    'href' => $this->url->link('product/category', 'path=' . $category['category_id'])
                );
            }
        }

        $data['language'] = $this->load->controller('common/language');
        $data['currency'] = $this->load->controller('common/currency');
        $data['search'] = $this->load->controller('common/search');
        $data['cart'] = $this->load->controller('common/cart');

        // For page specific css
        if (isset($this->request->get['route'])) {
            if (isset($this->request->get['product_id'])) {
                $class = '-' . $this->request->get['product_id'];
            } elseif (isset($this->request->get['path'])) {
                $class = '-' . $this->request->get['path'];
            } elseif (isset($this->request->get['manufacturer_id'])) {
                $class = '-' . $this->request->get['manufacturer_id'];
            } else {
                $class = '';
            }

            $data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
        } else {
            $data['class'] = 'common-home';
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/header.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/common/header.tpl', $data);
        } else {
            return $this->load->view('default/template/common/header.tpl', $data);
        }
    }

}

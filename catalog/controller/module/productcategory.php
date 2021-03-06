<?php
class ControllerModuleProductCategory extends Controller {

    public function index($setting) {
        $this->load->language('module/productcategory');

        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }

        $data['lang_code'] = $this->language->get('code');
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_tax'] = $this->language->get('text_tax');

        $data['button_cart'] = $this->language->get('button_cart');
        $data['button_wishlist'] = $this->language->get('button_wishlist');
        $data['button_compare'] = $this->language->get('button_compare');

        $this->load->model('catalog/product');

        $this->load->model('tool/image');

        $data['products'] = array();

        if (!$setting['limit']) {
            $setting['limit'] = 8;
        }

        //$data['category_title'] = $setting['name'];

        $data['category_titlelink'] = $setting['titlelink'];

        $data['left1_bottom'] = $server . 'image/' . $setting['productcategory_image1'];
        $data['left2'] = $server . 'image/' . $setting['productcategory_image2'];

        //$data['selected_titles'] = explode("|", $setting['selected']);
        
        if ($data['lang_code'] === 'en') {
            //category name
            if(!empty($setting['name_en'])){
                $data['category_title'] = $setting['name_en'];
            }else{
                $data['category_title'] = $setting['name'];
            }
            //product name
            if (!empty($setting['selected_en'])) {
                $data['selected_titles'] = explode("|", $setting['selected_en']);
            } else {
                //fall bakc to default language
                $data['selected_titles'] = explode("|", $setting['selected']);
            }
            //image2 title
            if (!empty($setting['image2title_en'])) {
                $data['image2_title'] = $setting['image2title_en'];
            } else {
                //fall bakc to default language
                $data['image2_title'] = $setting['image2title'];
            }
        }else{
            $data['category_title'] = $setting['name'];
            $data['selected_titles'] = explode("|", $setting['selected']);
            $data['image2_title'] = $setting['image2title'];
        }

        $data['selected_links'] = explode("|", $setting['selectedlink']);

        //$data['image2_title'] = $setting['image2title'];
        $data['image2_link'] = $setting['image2link'];

        $data['ad_title'] = explode("|", $setting['adtitle']);

        if (!empty($setting['product'])) {
            $products = array_slice($setting['product'], 0, (int) $setting['limit']);

            foreach ($products as $product_id) {
                $product_info = $this->model_catalog_product->getProduct($product_id);

                if ($product_info) {
                    if ($product_info['image']) {
                        $image = $this->model_tool_image->resize($product_info['image'], 350, 350);
                    } else {
                        $image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
                    }

                    if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                        $price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
                    } else {
                        $price = false;
                    }

                    if ((float) $product_info['special']) {
                        $special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
                    } else {
                        $special = false;
                    }

                    if ($this->config->get('config_tax')) {
                        $tax = $this->currency->format((float) $product_info['special'] ? $product_info['special'] : $product_info['price']);
                    } else {
                        $tax = false;
                    }

                    if ($this->config->get('config_review_status')) {
                        $rating = $product_info['rating'];
                    } else {
                        $rating = false;
                    }

                    $data['products'][] = array(
                        'product_id' => $product_info['product_id'],
                        'thumb' => $image,
                        'name' => $product_info['name'],
                        'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
                        'price' => $price,
                        'special' => $special,
                        'tax' => $tax,
                        'rating' => $rating,
                        'href' => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
                    );
                }
            }
        }

        if ($data['products']) {
            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/productcategory.tpl')) {
                return $this->load->view($this->config->get('config_template') . '/template/module/productcategory.tpl', $data);
            } else {
                return $this->load->view('default/template/module/productcategory.tpl', $data);
            }
        }
    }

}

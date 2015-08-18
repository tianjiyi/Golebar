<?php

class ControllerModuleCategoryPictures extends Controller {

    public function index() {
        $this->load->language('module/categorypictures'); // loads the language file of categorypictures

        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }

        $data['image_value1'] = $server . 'image/' . $this->config->get('categorypictures_image1');
        $data['image_title1'] = explode("|", ($this->config->get('categorypictures_image1title')));

        $data['image_value2'] = $server . 'image/' . $this->config->get('categorypictures_image2');
        $data['image_title2'] = explode("|", ($this->config->get('categorypictures_image2title')));

        $data['image_value3'] = $server . 'image/' . $this->config->get('categorypictures_image3');
        $data['image_title3'] = explode("|", ($this->config->get('categorypictures_image3title')));

        $data['image_value4'] = $server . 'image/' . $this->config->get('categorypictures_image4');
        $data['image_title4'] = explode("|", ($this->config->get('categorypictures_image4title')));

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/categorypictures.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/categorypictures.tpl', $data);
        } else {
            return $this->load->view('default/template/module/categorypictures.tpl', $data);
        }
    }
}

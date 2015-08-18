<?php
class ControllerModuleProductCategory extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/productcategory');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('productcategory', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');

		$data['entry_name'] = $this->language->get('entry_name');
                $data['entry_name_en'] = $this->language->get('entry_name_en'); //TODO: consider pop dynamically, if at least 3 languages needed
		$data['entry_product'] = $this->language->get('entry_product');
		$data['entry_limit'] = $this->language->get('entry_limit');
		$data['entry_width'] = $this->language->get('entry_width');
		$data['entry_height'] = $this->language->get('entry_height');
		$data['entry_status'] = $this->language->get('entry_status');
		
		$data['entry_titlelink'] = $this->language->get('entry_titlelink');
		$data['entry_selected'] = $this->language->get('entry_selected');
                $data['entry_selected_en'] = $this->language->get('entry_selected_en');
		$data['entry_selected_placeholder'] = $this->language->get('entry_selected_placeholder');
		$data['entry_selectedlink'] = $this->language->get('entry_selectedlink');
		
		$data['entry_image1'] = $this->language->get('entry_image1');
		$data['entry_image2'] = $this->language->get('entry_image2');
		$data['entry_image2_link'] = $this->language->get('entry_image2_link');
		$data['entry_image2_title'] = $this->language->get('entry_image2_title');
                $data['entry_image2_title_en'] = $this->language->get('entry_image2_title_en');
		
		$data['entry_ad_title'] = $this->language->get('ad_title');

		$data['help_product'] = $this->language->get('help_product');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['width'])) {
			$data['error_width'] = $this->error['width'];
		} else {
			$data['error_width'] = '';
		}

		if (isset($this->error['height'])) {
			$data['error_height'] = $this->error['height'];
		} else {
			$data['error_height'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/productcategory', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/productcategory', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/productcategory', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/productcategory', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
                
                if (isset($this->request->post['name_en'])) {
			$data['name_en'] = $this->request->post['name_en'];
		} elseif (!empty($module_info) && array_key_exists('name_en', $module_info)) {
			$data['name_en'] = $module_info['name_en'];
		} else {
			$data['name_en'] = '';
		}

		$this->load->model('catalog/product');

		$data['products'] = array();

		if (isset($this->request->post['product'])) {
			$products = $this->request->post['product'];
		} elseif (!empty($module_info)) {
			$products = $module_info['product'];
		} else {
			$products = array();
		}

		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);

			if ($product_info) {
				$data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'name'       => $product_info['name']
				);
			}
		}

		if (isset($this->request->post['limit'])) {
			$data['limit'] = $this->request->post['limit'];
		} elseif (!empty($module_info)) {
			$data['limit'] = $module_info['limit'];
		} else {
			$data['limit'] = 5;
		}
		
		if (isset($this->request->post['selected'])) {
			$data['selected'] = $this->request->post['selected'];
		} elseif (!empty($module_info)) {
			$data['selected'] = $module_info['selected'];
		} else {
			$data['selected'] = '';
		}
                
                if (isset($this->request->post['selected_en'])) {
			$data['selected_en'] = $this->request->post['selected_en'];
		} elseif (!empty($module_info) && array_key_exists('selected_en', $module_info)) {
			$data['selected_en'] = $module_info['selected_en'];
		} else {
			$data['selected_en'] = '';
		}
		
		if (isset($this->request->post['titlelink'])) {
			$data['titlelink'] = $this->request->post['titlelink'];
		} elseif (!empty($module_info)) {
			$data['titlelink'] = $module_info['titlelink'];
		} else {
			$data['titlelink'] = '';
		}
		
		if (isset($this->request->post['selectedlink'])) {
			$data['selectedlink'] = $this->request->post['selectedlink'];
		} elseif (!empty($module_info)) {
			$data['selectedlink'] = $module_info['selectedlink'];
		} else {
			$data['selectedlink'] = '';
		}
		
		if (isset($this->request->post['image2link'])) {
			$data['image2link'] = $this->request->post['image2link'];
		} elseif (!empty($module_info)) {
			$data['image2link'] = $module_info['image2link'];
		} else {
			$data['image2link'] = '';
		}
		
		if (isset($this->request->post['image2title'])) {
			$data['image2title'] = $this->request->post['image2title'];
		} elseif (!empty($module_info)) {
			$data['image2title'] = $module_info['image2title'];
		} else {
			$data['image2title'] = '';
		}
                
                if (isset($this->request->post['image2title_en'])) {
			$data['image2title_en'] = $this->request->post['image2title_en'];
		} elseif (!empty($module_info) && array_key_exists('image2title_en', $module_info)) {
			$data['image2title_en'] = $module_info['image2title_en'];
		} else {
			$data['image2title_en'] = '';
		}
		
		if (isset($this->request->post['adtitle'])) {
			$data['adtitle'] = $this->request->post['adtitle'];
		} elseif (!empty($module_info)) {
			$data['adtitle'] = $module_info['adtitle'];
		} else {
			$data['adtitle'] = '';
		}
		
		//image1
		if (isset($this->request->post['productcategory_image1'])) {
			$data['productcategory_image1'] = $this->request->post['productcategory_image1'];
		} elseif (!empty($module_info)) {
			$data['productcategory_image1'] = $module_info['productcategory_image1'];
		} else {
			$data['productcategory_image1'] = '';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['productcategory_image1']) && is_file(DIR_IMAGE . $this->request->post['productcategory_image1'])) {
			$data['image1'] = $this->model_tool_image->resize($this->request->post['productcategory_image1'], 100, 100);
		} elseif (!empty($module_info) && $module_info['productcategory_image1'] && is_file(DIR_IMAGE . $module_info['productcategory_image1'])) {
			$data['image1'] = $this->model_tool_image->resize($module_info['productcategory_image1'], 100, 100);
		} else {
			$data['image1'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		
		//image2
		if (isset($this->request->post['productcategory_image2'])) {
			$data['productcategory_image2'] = $this->request->post['productcategory_image2'];
		} elseif (!empty($module_info)) {
			$data['productcategory_image2'] = $module_info['productcategory_image2'];
		} else {
			$data['productcategory_image2'] = '';
		}

		$this->load->model('tool/image');

		if (isset($this->request->post['productcategory_image2']) && is_file(DIR_IMAGE . $this->request->post['productcategory_image2'])) {
			$data['image2'] = $this->model_tool_image->resize($this->request->post['productcategory_image2'], 100, 100);
		} elseif (!empty($module_info) && $module_info['productcategory_image2'] && is_file(DIR_IMAGE . $module_info['productcategory_image2'])) {
			$data['image2'] = $this->model_tool_image->resize($module_info['productcategory_image2'], 100, 100);
		} else {
			$data['image2'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		}
		
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);
		


		if (isset($this->request->post['width'])) {
			$data['width'] = $this->request->post['width'];
		} elseif (!empty($module_info)) {
			$data['width'] = $module_info['width'];
		} else {
			$data['width'] = 200;
		}

		if (isset($this->request->post['height'])) {
			$data['height'] = $this->request->post['height'];
		} elseif (!empty($module_info)) {
			$data['height'] = $module_info['height'];
		} else {
			$data['height'] = 200;
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/productcategory.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/productcategory')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (!$this->request->post['width']) {
			$this->error['width'] = $this->language->get('error_width');
		}

		if (!$this->request->post['height']) {
			$this->error['height'] = $this->language->get('error_height');
		}
		
		if (!$this->request->post['selected']) {
			$this->error['selected'] = $this->language->get('error_selected');
		}
		
		if (!$this->request->post['selectedlink']) {
			$this->error['selectedlink'] = $this->language->get('error_selectedlink');
		}
			
		if (!$this->request->post['image2link']) {
			$this->error['image2link'] = $this->language->get('error_image2link');
		}
		
		if (!$this->request->post['image2title']) {
			$this->error['image2title'] = $this->language->get('error_image2_title');
		}
		
		if (!$this->request->post['adtitle']) {
			$this->error['adtitle'] = $this->language->get('error_adtitle');
		}

		return !$this->error;
	}
}
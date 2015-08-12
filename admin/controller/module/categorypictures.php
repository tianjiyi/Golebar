<?php
class ControllerModuleCategoryPictures extends Controller {
    private $error = array(); // This is used to set the errors, if any.
 
    public function index() {
        // Loading the language file of categorypictures
        $this->load->language('module/categorypictures');
     
        // Set the title of the page to the heading title in the Language file i.e., Hello World
        $this->document->setTitle($this->language->get('heading_title'));

        // Load the Setting Model  (All of the OpenCart Module & General Settings are saved using this Model )
        $this->load->model('setting/setting');
     
        // Start If: Validates and check if data is coming by save (POST) method
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            // Parse all the coming data to Setting Model to save it in database.
            $this->model_setting_setting->editSetting('categorypictures', $this->request->post);
            
            if ($this->config->get('categorypictures_image')) {
	            $data['categorypictures_image'] = $this->config->get('categorypictures_image');
            }
     
            // To display the success text on data save
            $this->session->data['success'] = $this->language->get('text_success');
     
            // Redirect to the Module Listing
            $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }
     
        // Assign the language data for parsing it to view
        $data['heading_title'] = $this->language->get('heading_title');
     
        $data['text_edit']    = $this->language->get('text_edit');
        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');
        $data['text_content_top'] = $this->language->get('text_content_top');
        $data['text_content_bottom'] = $this->language->get('text_content_bottom');      
        $data['text_column_left'] = $this->language->get('text_column_left');
        $data['text_column_right'] = $this->language->get('text_column_right');
     
        $data['entry_code'] = $this->language->get('entry_code');
        //$data['entry_layout'] = $this->language->get('entry_layout');
        //$data['entry_position'] = $this->language->get('entry_position');
        $data['entry_status'] = $this->language->get('entry_status');
        //$data['entry_sort_order'] = $this->language->get('entry_sort_order');
     
        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_add_module'] = $this->language->get('button_add_module');
        $data['button_remove'] = $this->language->get('button_remove');
        $data['entry_image1'] = $this->language->get('entry_image1');
        $data['entry_image2'] = $this->language->get('entry_image2');
        $data['entry_image3'] = $this->language->get('entry_image3');
        $data['entry_image4'] = $this->language->get('entry_image4');
        $data['entry_image1_title'] = $this->language->get('entry_image1_title');
        $data['entry_image2_title'] = $this->language->get('entry_image2_title');
        $data['entry_image3_title'] = $this->language->get('entry_image3_title');
        $data['entry_image4_title'] = $this->language->get('entry_image4_title');
         
        // This Block returns the warning if any
        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }
     
        // This Block returns the error code if any
        if (isset($this->error['code'])) {
            $data['error_code'] = $this->error['code'];
        } else {
            $data['error_code'] = '';
        }  
        
        // This Block returns the error image if any
        if (isset($this->error['image'])) {
            $data['error_image'] = $this->error['image'];
        } else {
            $data['error_image'] = '';
        }     
     
        // Making of Breadcrumbs to be displayed on site
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );
        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_module'),
            'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('module/categorypictures', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );
          
        $data['action'] = $this->url->link('module/categorypictures', 'token=' . $this->session->data['token'], 'SSL'); // URL to be directed when the save button is pressed
     
        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'); // URL to be redirected when cancel button is pressed
              
        // This block checks, if the hello world text field is set it parses it to view otherwise get the default 
        // hello world text field from the database and parse it
        /*
        if (isset($this->request->post['categorypictures_text_field'])) {
            $data['categorypictures_text_field'] = $this->request->post['categorypictures_text_field'];
        } else {
            $data['categorypictures_text_field'] = $this->config->get('categorypictures_text_field');
        }
        */
        
		if (isset($this->request->post['categorypictures_image1title'])) {
			$data['categorypictures_image1title'] = $this->request->post['categorypictures_image1title'];
		} else {
			$data['categorypictures_image1title'] = $this->config->get('categorypictures_image1title');
		}
		
		if (isset($this->request->post['categorypictures_image2title'])) {
			$data['categorypictures_image2title'] = $this->request->post['categorypictures_image2title'];
		} else {
			$data['categorypictures_image2title'] = $this->config->get('categorypictures_image2title');
		}
		
		if (isset($this->request->post['categorypictures_image3title'])) {
			$data['categorypictures_image3title'] = $this->request->post['categorypictures_image3title'];
		} else {
			$data['categorypictures_image3title'] = $this->config->get('categorypictures_image3title');
		}
		
		if (isset($this->request->post['categorypictures_image4title'])) {
			$data['categorypictures_image4title'] = $this->request->post['categorypictures_image4title'];
		} else {
			$data['categorypictures_image4title'] = $this->config->get('categorypictures_image4title');
		}
		

        // This block parses the status (enabled / disabled)
        if (isset($this->request->post['categorypictures_status'])) {
            $data['categorypictures_status'] = $this->request->post['categorypictures_status'];
        } else {
            $data['categorypictures_status'] = $this->config->get('categorypictures_status');
        }
        
        //image 1
		if (isset($this->request->post['categorypictures_image1'])) {
			$data['categorypictures_image1'] = $this->request->post['categorypictures_image1'];
		} else {
			$data['categorypictures_image1'] = $this->config->get('categorypictures_image1');
		}
		
		$this->load->model('tool/image');
		
		if (isset($this->request->post['categorypictures_image1']) && is_file(DIR_IMAGE . $this->request->post['categorypictures_image1'])) {
			$data['image1'] = $this->model_tool_image->resize($this->request->post['categorypictures_image1'], 100, 64);
		} elseif ($this->config->get('categorypictures_image1') && is_file(DIR_IMAGE . $this->config->get('categorypictures_image1'))) {
			$data['image1'] = $this->model_tool_image->resize($this->config->get('categorypictures_image1'), 100, 64);
		} else {
			$data['image1'] = $this->model_tool_image->resize('no_image.png', 100, 64);
		}
		
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 64);
		
		//image 2
		if (isset($this->request->post['categorypictures_image2'])) {
			$data['categorypictures_image2'] = $this->request->post['categorypictures_image2'];
		} else {
			$data['categorypictures_image2'] = $this->config->get('categorypictures_image2');
		}
		
		$this->load->model('tool/image');
		
		if (isset($this->request->post['categorypictures_image2']) && is_file(DIR_IMAGE . $this->request->post['categorypictures_image2'])) {
			$data['image2'] = $this->model_tool_image->resize($this->request->post['categorypictures_image2'], 100, 64);
		} elseif ($this->config->get('categorypictures_image2') && is_file(DIR_IMAGE . $this->config->get('categorypictures_image2'))) {
			$data['image2'] = $this->model_tool_image->resize($this->config->get('categorypictures_image2'), 100, 64);
		} else {
			$data['image2'] = $this->model_tool_image->resize('no_image.png', 100, 64);
		}
		
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 64);
		
		//image 3
		if (isset($this->request->post['categorypictures_image3'])) {
			$data['categorypictures_image3'] = $this->request->post['categorypictures_image3'];
		} else {
			$data['categorypictures_image3'] = $this->config->get('categorypictures_image3');
		}
		
		$this->load->model('tool/image');
		
		if (isset($this->request->post['categorypictures_image3']) && is_file(DIR_IMAGE . $this->request->post['categorypictures_image3'])) {
			$data['image3'] = $this->model_tool_image->resize($this->request->post['categorypictures_image3'], 100, 64);
		} elseif ($this->config->get('categorypictures_image3') && is_file(DIR_IMAGE . $this->config->get('categorypictures_image3'))) {
			$data['image3'] = $this->model_tool_image->resize($this->config->get('categorypictures_image3'), 100, 64);
		} else {
			$data['image3'] = $this->model_tool_image->resize('no_image.png', 100, 64);
		}
		
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 64);
		
		//image 4
		if (isset($this->request->post['categorypictures_image4'])) {
			$data['categorypictures_image4'] = $this->request->post['categorypictures_image4'];
		} else {
			$data['categorypictures_image4'] = $this->config->get('categorypictures_image4');
		}
		
		$this->load->model('tool/image');

		if (isset($this->request->post['categorypictures_image4']) && is_file(DIR_IMAGE . $this->request->post['categorypictures_image4'])) {
			$data['image4'] = $this->model_tool_image->resize($this->request->post['categorypictures_image4'], 100, 64);
		} elseif ($this->config->get('categorypictures_image4') && is_file(DIR_IMAGE . $this->config->get('categorypictures_image4'))) {
			$data['image4'] = $this->model_tool_image->resize($this->config->get('categorypictures_image4'), 100, 64);
		} else {
			$data['image4'] = $this->model_tool_image->resize('no_image.png', 100, 64);
		}
		
		$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 64);

        
        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('module/categorypictures.tpl', $data));

    }

    /* Function that validates the data when Save Button is pressed */
    protected function validate() {
 
        // Block to check the user permission to manipulate the module
        if (!$this->user->hasPermission('modify', 'module/categorypictures')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
 
        // Block to check if the categorypictures_text_field is properly set to save into database,
        // otherwise the error is returned
        /*
        if (!$this->request->post['categorypictures_text_field']) {
            $this->error['code'] = $this->language->get('error_code');
        }
        */
        
        /* End Block*/
 
        // Block returns true if no error is found, else false if any error detected
        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
}
<?php
class ControllerCheckoutSuccess extends Controller {
	public function index() {
		$this->load->language('checkout/success');
	
		$this->load->model('catalog/category');
		
		$products = $this->cart->getProducts();
		

		if (isset($this->session->data['order_id'])) {
			$data['order_id'] = $this->session->data['order_id']; // <-- NEW LINE
			
			//begin linkhaitao -------------------------------------
			$order_id = $data['order_id'];
		
			$priceList = ""; //goodsprice
//			$quantityList = ""; // goodsmark
                        $markList = ""; // goodsmark
			$key = "golebar2015"; //set in linkhaitao backend
			$sig = md5($order_id.$key); // order+key
			$sigUpdate = md5($order_id.'true'.''.$key); //order+valid+status+key
			$nameList = ""; //product name list (goodsname)
			
			//check if the product is belongs duck ton food and record its price and quantity
			foreach ($products as $product) {
	
				$product_manufacture = $product['manufacturer_id'];
				$product_price = $product['price'];
				$product_quantity = $product['quantity'];
                                $product_total_price = $product_price * $product_quantity;
				$product_name = $product['name'];
				if ($product_manufacture == "35") {
					$markList = $markList."1"."|";
				}elseif (stripos($product_name, "月饼") || stripos($product_name, "mooncake")) {
                                        $markList = $markList."3"."|";
                                }else{
                                    $markList = $markList."2"."|";
                                }
				$priceList = $priceList.$product_total_price."|";
				//$quantityList = $quantityList.$product_quantity."|";
				$nameList = $nameList.$product_name."|";
			}
			
			if (isset($_COOKIE["linkhaitao"])) {
				//setcookie("Result", $order_id.' '.$priceList.' '.$quantityList.' '.$sig.' '.$_COOKIE["linkhaitao"], time() + 3600 * 24 * 7, '/');
				/*
				setcookie("order", $order_id, time() + 3600 * 24 * 7, '/');
				setcookie("goodsname", $nameList, time() + 3600 * 24 * 7, '/');
				setcookie("goodsprice", $priceList, time() + 3600 * 24 * 7, '/');
				setcookie("goodsmark", $quantityList, time() + 3600 * 24 * 7, '/');
				setcookie("sig", $sig, time() + 3600 * 24 * 7, '/');
				setcookie("trackid", $_COOKIE["linkhaitao"], time() + 3600 * 24 * 7, '/');
				setcookie("sigUpdate", $sigUpdate, time() + 3600 * 24 * 7, '/');
				*/
				if ($priceList != "") {
						
					//get rid of last char
					$priceList = rtrim($priceList, "|");
					//$quantityList = rtrim($quantityList, "|");
					$nameList = rtrim($nameList, "|");
                                        $markList = rtrim($markList, "|");
					
					//post to linkhaitao
				
					//create
					$url = 'http://www.linkhaitao.com/service/transfer.php?mod=create';
					$myvars = 'order=' . $order_id . '&goodsname='. $nameList . '&goodsprice=' . $priceList . '&goodsmark=' . $markList . '&sig=' . $sig . '&trackid=' . $_COOKIE["linkhaitao"];
					
					$ch = curl_init( $url );
					curl_setopt( $ch, CURLOPT_POST, 1);
					curl_setopt( $ch, CURLOPT_POSTFIELDS, $myvars);
					curl_setopt( $ch, CURLOPT_FOLLOWLOCATION, 1);
					curl_setopt( $ch, CURLOPT_HEADER, 0);
					curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1);
					
					$response = curl_exec( $ch );
					setcookie("responseCreate", $response, time() + 3600 * 24, '/');
					
					//update and confirm
					$url1 = 'http://www.linkhaitao.com/service/transfer.php?mod=update';
					$myvars1 = 'order=' . $order_id .  '&valid=' . 'true' . '&sig=' . $sigUpdate . '&trackid=' . $_COOKIE["linkhaitao"];
					
					$ch1 = curl_init( $url1 );
					curl_setopt( $ch1, CURLOPT_POST, 1);
					curl_setopt( $ch1, CURLOPT_POSTFIELDS, $myvars1);
					curl_setopt( $ch1, CURLOPT_FOLLOWLOCATION, 1);
					curl_setopt( $ch1, CURLOPT_HEADER, 0);
					curl_setopt( $ch1, CURLOPT_RETURNTRANSFER, 1);
					
					$responseC = curl_exec( $ch1 );
					setcookie("responseConfirm", $responseC, time() + 3600 * 24, '/');
				}
				
			}
								
			//end linkhaitao-------------------------------------		
			
			$this->cart->clear();

			// Add to activity log
			$this->load->model('account/activity');

			if ($this->customer->isLogged()) {
				$activity_data = array(
					'customer_id' => $this->customer->getId(),
					'name'        => $this->customer->getFirstName() . ' ' . $this->customer->getLastName(),
					'order_id'    => $this->session->data['order_id']
				);

				$this->model_account_activity->addActivity('order_account', $activity_data);
			} else {
				$activity_data = array(
					'name'     => $this->session->data['guest']['firstname'] . ' ' . $this->session->data['guest']['lastname'],
					'order_id' => $this->session->data['order_id']
				);

				$this->model_account_activity->addActivity('order_guest', $activity_data);
			}

			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['guest']);
			unset($this->session->data['comment']);
			unset($this->session->data['order_id']);
			unset($this->session->data['coupon']);
			unset($this->session->data['reward']);
			unset($this->session->data['voucher']);
			unset($this->session->data['vouchers']);
			unset($this->session->data['totals']);
		}

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_basket'),
			'href' => $this->url->link('checkout/cart')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_checkout'),
			'href' => $this->url->link('checkout/checkout', '', 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_success'),
			'href' => $this->url->link('checkout/success')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		if ($this->customer->isLogged()) {
			$data['text_message'] = sprintf($this->language->get('text_customer'), $this->url->link('account/account', '', 'SSL'), $this->url->link('account/order', '', 'SSL'), $this->url->link('account/download', '', 'SSL'), $this->url->link('information/contact'));
		} else {
			$data['text_message'] = sprintf($this->language->get('text_guest'), $this->url->link('information/contact'));
		}

		$data['button_continue'] = $this->language->get('button_continue');

		$data['continue'] = $this->url->link('common/home');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
		

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/success.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/success.tpl', $data));
		}
	}
}
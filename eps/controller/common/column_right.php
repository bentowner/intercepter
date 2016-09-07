<?php
class ControllerCommonColumnRight extends Controller {
	public function index() {
		if (isset($this->request->get['token']) && isset($this->session->data['token']) && ($this->request->get['token'] == $this->session->data['token'])) {
		
			$this->load->model('service/booking');
			$this->load->model('service/quotations');
			$this->load->model('report/customer');
			
			
			if (isset($this->session->data['booking_drafts'])){$data['booking_drafts'] = $this->session->data['booking_drafts']; } else {$data['booking_drafts'] = '';   }
			
			$results = $this->model_service_booking->getBookingObjects();
			
			//&filter_customer_code=710516
			
			if ($results){
				foreach ($results as $result) {
					
					$action  = array();
						
					$action[] = array(
							'text' => $result,
							'href' => $this->url->link('service/booking/useObject', 'token=' . $this->session->data['token'] . '&object=' . $result , 'SSL'),
							'release' => $this->url->link('service/booking/deleteBookingDraft', 'token=' . $this->session->data['token'] . '&object=' . $result , 'SSL'),
							'update'=> $this->url->link('service/booking/updateBookingDraft', 'token=' . $this->session->data['token'] . '&object=' . $result , 'SSL'),
							'goodtill'=> $this->model_service_booking->getObjectTime($result)
							
					);
			
					$data['booking_drafts'][] = array('action' => $action);
				}
				 
			}

			
			if (isset($this->session->data['quote_drafts'])){$data['quote_drafts'] = $this->session->data['quote_drafts']; } else {$data['quote_drafts'] = '';   }
			
			$results = $this->model_service_quotations->getQuoteObjects();
			
			if ($results){
				foreach ($results as $result) {
					$action  = array();
						
					$action[] = array(
							'text' => $result,
							'href' => $this->url->link('service/quotations/useObject', 'token=' . $this->session->data['token'] . '&object=' . $result , 'SSL'),
							'release' => $this->url->link('service/quotations/deleteQuoteDraft', 'token=' . $this->session->data['token'] . '&object=' . $result , 'SSL'),
							'update'=> $this->url->link('service/quotations/updateQuoteDraft', 'token=' . $this->session->data['token'] . '&object=' . $result , 'SSL'),
							'goodtill'=> $this->model_service_quotations->getObjectTime($result)
					);
			
					$data['quote_drafts'][] = array('action' => $action);
				}
				 
			}

			
			if (isset($this->session->data['customer'])){
				$this->load->model('service/customer');
				
				$data['customer'] = $this->session->data['customer']; 
				$customer = $data['customer'];
				$customername = $this->model_service_customer->getCustomerName($customer);
				$customer_info = $this->model_service_customer->getCustomer($data['customer']);
				
				$data['customerName']=$customer_info['CustName1'];
				
				
				$data['customer_id'] =$customer_id = $customer_info['CustCode'];
				$data['customer_quote_link'] = $this->url->link('service/quotations', 'token=' . $this->session->data['token'] . '&filter_customer_code=' . $customer_id , 'SSL');
				$data['customer_booking_link'] = $this->url->link('service/booking', 'token=' . $this->session->data['token'] . '&filter_customer_code=' . $customer_id , 'SSL');
				$data['customer_total_booking'] = $this->model_report_customer->getTotalBookings(array('filter_customer_id' => $customer,'filter_valid'=>'true'));
				$data['customer_90day_booking'] = $this->model_report_customer->getTotalBookings(array('filter_customer_id' => $customer,'filter_valid'=>'true','filter_day_ago'=>'90'));
				$data['customer_total_quote'] = $this->model_report_customer->getTotalQuotes(array('filter_customer_id' => $customer,'filter_valid'=>'true'));
				$data['customer_90day_quote'] = $this->model_report_customer->getTotalQuotes(array('filter_customer_id' => $customer,'filter_valid'=>'true','filter_day_ago'=>'90'));
				$data['customer_sales_rep'] = $this->model_report_customer->getSalesRep(array('filter_customer_code' => $customer));
				
				
			} else {
				$data['customer'] = '';   
			}
			
			
			
			
			
			return $this->load->view('common/column_right.tpl', $data);
		}
	}
}
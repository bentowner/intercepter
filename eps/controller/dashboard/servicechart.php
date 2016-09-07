<?php
class ControllerDashboardServicechart extends Controller {
	public function index() {
		$this->load->language('dashboard/servicechart');

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_duein'] = $this->language->get('text_duein');
		$data['text_freight'] = $this->language->get('text_freight');
		$data['text_sameday'] = $this->language->get('text_sameday');

		$data['token'] = $this->session->data['token'];

		$this->load->model('service/service');
		
		$origin = array(
				'filter_name' => ''
		);
		$data['service'] = $this->model_service_service->getPortofLoading($origin);
		
		if (isset($this->request->get['service_selected'])) {
			$this->session->data['service_selected'] = $data['service_selected'] = $this->request->get['service_selected'];
		} else {
			$data['service_selected'] = "";
		}
		
		if (isset($this->session->data['service_selected'])){$data['service_selected']=$this->session->data['service_selected'];}
		
		
		return $this->load->view('dashboard/servicechart.tpl', $data);
	}
	
	public function chartService() {
		$this->load->language('dashboard/servicechart');
		 
		$dataService = array();
		 
		$dataService['open'] = array();
		$dataService['overdue'] = array();
		$dataService['received'] = array();
		$dataService['intransit'] = array();
		$dataService['xaxis'] = array();
		 
	
		if (isset($this->request->get['service_selected'])) {
			$this->session->data['service_selected'] = $data['service_selected'] = $this->request->get['service_selected'];
		} else {
			$data['service_selected'] = "NONE";
		}
		
		if (isset($this->session->data['service_selected'])){$data['service_selected']=$this->session->data['service_selected'];}
		
		
		if (isset($this->request->get['service_selected'])){
			$this->session->data['service_selected'] =$service_selected = $this->request->get['service_selected'];
			$data['service_selected'] = $service_selected;
				
		} else {
			$service_selected ='NONE';
		}
	
		switch ($service_selected) {
			case $service_selected:
				for ($i = 0; $i < 24; $i++) {
						
					//Open
					if ($service_selected =='NONE' ) {$query = $this->db->query("select count(*) AS total from lcl_book where bkstat = 'O' ");
					$open = $query->row['total'];
					} else{	$query = $this->db->query("select count(*) AS total from lcl_book where bkstat = 'O' and bkorig = '".$service_selected."'  ");
					$open = $query->row['total'];
					}
						
					if ($query->num_rows) {	$dataService['open']['data'][]  = array($i, (int)$query->row['total']);
					} else {				$dataService['open']['data'][]  = array($i, 0);  					}
						
					//Received
					if ($service_selected=='NONE' ) {
						$query = $this->db->query("select count(*) AS total from lcl_book where bkstat = 'R' ");
						$received = $query->row['total'];
					} else {
						$query = $this->db->query("select count(*) AS total from lcl_book where bkstat = 'R' and bkorig = '".$service_selected."'  ");
						$received = $query->row['total'];
					}
					if ($query->num_rows) {
						$dataService['received']['data'][] = array($i, (int)$query->row['total']);
					} else {
						$dataService['received']['data'][] = array($i, 0);
					}
					//Overdue
					if ($service_selected=='NONE' ) {$query = $this->db->query("select count(*) AS total from lcl_book where bkstat = 'O' and bkidd >= BkLDD and BkLDD = date('Y-m-d') ");
					$overdue = $query->row['total'];
					} else{	$query = $this->db->query("select count(*) AS total from lcl_book where bkstat = 'O' and bkidd >= BkLDD and BkLDD = date('Y-m-d') and bkorig = '".$service_selected."'  ");
					$overdue = $query->row['total'];
					}
	
					if ($query->num_rows) {	$dataService['overdue']['data'][]  = array($i, (int)$query->row['total']);
					} else {				$dataService['overdue']['data'][]  = array($i, 0);  					}
						
					/*In-Transit
					if ($service_selected=='NONE' ) {$query = $this->db->query("select count(*) AS total from lcl_book where bkstat = 'R' and Bkapl != BkOrig");
					$transit = $query->row['total'];
					} else{	$query = $this->db->query("select count(*) AS total from lcl_book where bkstat = 'R' and Bkapl != BkOrig and bkorig = '".$service_selected."'  ");
					$transit = $query->row['total'];
					}
						
					if ($query->num_rows) {	$dataService['intransit']['data'][]  = array($i, (int)$query->row['total']);
					} else {				$dataService['intransit']['data'][]  = array($i, 0);  					}
	
					*/
						
						
					$dataService['xaxis'][] = array($i, 0);
					//$dataService['xaxis'][] = array($i, date('H', mktime($i, 0, 0, date('n'), date('j'), date('Y'))));
				}
				$open_link = $this->url->link('service/booking', 'token=' . $this->session->data['token'] . '&filter_origin=' .$service_selected.'&filter_status=O', 'SSL');
				$received_link =$this->url->link('service/booking', 'token=' . $this->session->data['token'] . '&filter_origin=' .$service_selected.'&filter_status=R', 'SSL');
				$sameday_link = $this->url->link('service/booking', 'token=' . $this->session->data['token'] . '&filter_origin=' .$service_selected.'&filter_sameday=' .$service_selected, 'SSL');
	
				$dataService['open']['label'] = '<a href="'. $open_link.'"> Due In</a> - '.$open.' Open Bookings';
				$dataService['received']['label'] = '<a href="'. $received_link.'" >Freight In</a> - '.$received.' Received Bookings';
				$dataService['overdue']['label'] = '<a href="'. $sameday_link.'" >Same Day</a> '.$overdue.' Open Bookings';
				//$dataService['intransit']['label'] = 'In-Transit '.$transit.' Received Bookings';
				break;
		}
	
	
		$this->response->addHeader('Content-Type: application/json');
			
		$this->response->setOutput(json_encode($dataService));
	}
	
}

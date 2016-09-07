<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
      
       <a type="button" id="button-save" href="<?php echo $save; ?>"  class="btn btn-primary"><i class="fa fa-check-circle"></i> <?php echo $button_save; ?></a>
       <a href="<?php echo $cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i> <?php echo $button_cancel; ?></a>
      
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>	
      </ul>
      <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
      </div>  
       <div class="panel-body">
       <form class="form" role="form" method="post" action="<?php echo $action; ?>">
     
     <div class="well">	
              <div class="col-lg-2">
             <div class="form-group">Customer Code</div>
              <div class="form-group"><?php echo $customer_code;?></div>
         </div>
      	 <div class="col-lg-3">
              <div class="form-group">Customer</div>
              <div class="form-group"><?php echo $customer_name;?></div>
         </div>

         <div class="col-lg-4">
              <div class="form-group">City, State and Zip Code</div>
              <div class="form-group"><?php echo $customer_city;?></div>
         </div>
        
         <div class="col-lg-2">
              <div class="form-group">Phone Number</div>
              <div class="form-group"><?php echo $customer_tel;?></div>
         </div>
     </div><!---booking-type --->      
	
	
	 <ul id="customer" class="nav nav-tabs nav-justified">
            <li class="active" id = "general"><a href="#tab_general" data-toggle="tab" >General</a></li>
    		<li class="" id="contact"><a href="#tab_contact" data-toggle="tab" >Contact Info</a></li>
            <li class="" id="option"><a href="#tab_option" data-toggle="tab" >Options</a></li>
     		<li class="" id="account"><a href="#tab_account" data-toggle="tab" >Account</a></li>
            <li class="" id="lcl_dest_tab"><a href="#tab_lcl_dest" data-toggle="tab" >Sales Support</a></li>
            <li class="" id="fcl_tab"> <a href="#tab_fcl" data-toggle="tab" >EDI/email</a></li>
            <li class="" id="imports_tab"><a href="#tab_imports" data-toggle="tab" >Same</a></li>
            <li class="" id="routed_tab"><a href="#tab_routed" data-toggle="tab" >LCL</a></li>
            
            
   </ul>
   
			<div class="tab-content">
				<div class="tab-pane active" id="tab_general">
					  <div class ="tab_general">
						  <div class=".col-lg-12 col-md-12 col-sm-12">
							test
						  </div>
			 		  </div>
			    </div><!--- end tab #tab-general --->
			   
			    <div class="tab-pane" id="tab_contact" >
						<div class ="tab_contact">
							<div class=".col-lg-12 col-md-12 col-sm-12">
							test1
							</div>
						</div><!--"costs -content" -->
				</div>
				
				 <div class="tab-pane" id="tab_option" >
			    		<div class="tab_option">	
			    			<div class=".col-lg-12 col-md-12 col-sm-12">
			    			test2
			    			</div>
			    		</div><!--"tab_option-content" -->   		
				</div>
				
				<div class="tab-pane" id="tab_account" >
					    <div class="tab_account">
					    	<div class=".col-lg-12 col-md-12 col-sm-12">
					    	test3
					    	</div>
					    </div><!--"tab_account-content" -->   		
				</div>
				
				<div class="tab-pane" id="tab_lcl_dest" >
					    <div class="tab_lcl_dest">
					    	<div class=".col-lg-12 col-md-12 col-sm-12">
					    	test4
					    	</div>
					    </div><!--"tab_lcl_dest-content" -->   		
				</div>
				<div class="tab-pane" id="tab_fcl" >
			   			<div class="tab_fcl">
			   				<div class=".col-lg-12 col-md-12 col-sm-12">
			   				test5
			   				</div>
			   			</div><!--"tab_fcl-content" -->   		
				</div>
				
				<div class="tab-pane" id="tab_imports" >
			    		<div class="tab_imports">
			    			<div class=".col-lg-12 col-md-12 col-sm-12">
			    			test6
			    			</div>
			    		</div><!--"tab_imports-content" -->   		
				</div>
						
			</div><!-- end tab content-->		
			
		</div><!-- end panel body-->	
		 </form>
	</div><!-- end panel-->
</div><!-- end container--> 
</div>   
       
 <pre><?php echo print_r($_SESSION, TRUE) ; ?></pre>
<?php echo $footer; ?>
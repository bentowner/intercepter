<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/category.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
      <a href="<?php echo $search; ?>" class="button">Search</a>
      <a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
      <a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a>
      
      </div>
    </div>
    <div class="booking-type">
      		<div class="booking-heading">Load Plan</div>
			
			
    <div class="booking-content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      	
        <table class="box">
         <tr>
	         <td colspan ="4"></td>
	          <td><input type="checkbox">Released </td>
	          <td><input type="checkbox">Hazardous</td>
	          <td><input type="checkbox">Final Release</td>
	         
	      </tr>
          <tr>
	          <td>Reference </td>
	          <td>Vessel</td>
	          <td>Voyage</td>
	          <td>Sail Date</td>
	          
	      </tr>
           <tr>    
	          <td><input type="text" name="service" value="<?php echo $lp_ref;?>" size="15" /></td>
	          <td><input type="text" name="lb_from" value="<?php echo $lb_from;?>" size="15" /></td>
	          <td><input type="text" name="lb_date" value="<?php echo $lb_date;?>" size="15" /></td>
	          <td><input type="text" name="lb_date" value="<?php echo $lb_date;?>" size="15" /></td>
	       </tr>
 
       </table>	 
  
   </form>
   <div>
      <div id="tabs" class="htabs">
      	<div id = "lcl_tab" style="display:;"><a href="#tab_lcl">Cargo</a></div>
	    <div id = "lcl_hbl_tab" style="display:;"><a href="#tab_lcl_hbl">Load Notes</a></div>
	    <div id = "lcl_other_tab" style="display:;"><a href="#tab_lcl_other">Profit</a></div>
	    <div id = "lcl_dest_tab" style="display:;"><a href="#tab_lcl_dest">Profit</a></div>
	    </div>        
        
   <div id="tab_lcl">
   
   </div><!--- end tab lcl --->     
   
   <div id="tab_lcl_hbl">
   
   </div><!--- end tab_lcl_hbl--->  
   
   <div id="tab_lcl_other">
   
   </div><!--- endtab_lcl_other---> 
    
   <div id="tab_lcl_dest">
   
   </div><!--- end tab_lcl_dest--->  
   
  
   
   </div><!--- end tab_routed--->  
	</div>
	</div>
</div>
<script type="text/javascript">$('#tabs a').tabs();</script> 
<script type="text/javascript">window.onload(function() {location.reload();});</script>
<?php echo $footer; ?>
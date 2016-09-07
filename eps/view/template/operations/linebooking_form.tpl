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
      		<div class="booking-heading">Line Booking</div>
			
			
    <div class="booking-content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      	
        <table class="box">
          <tr>
	          <td>
	          <table><tr>
	          <td>Reference </td>
	          <td>From</td>
	          <td>Date</td>
	      </tr>
           <tr>    
	          <td><input type="text" name="service" value="<?php echo $lb_ref;?>" size="15" /></td>
	          <td><input type="text" name="lb_from" value="<?php echo $lb_from;?>" size="15" /></td>
	          <td><input type="text" name="lb_date" value="<?php echo $lb_date;?>" size="15" /></td>
	       </tr>
          <tr>
              <td>&nbsp;</td>
          </tr>
          <tr>
              <td>To:<?php echo $lb_to;?></td>
		  </tr>
          
          <tr>
              <td colspan ="3"><textarea rows="2" cols="53"></textarea></td>
		  </tr>
		  
		  <tr>
              <td colspan ="3"><input value = "<?php echo $lb_email;?>" size = "48"></td> 
		  </tr>
		  <tr>
              <td colspan ="3">Pick Container From: <?php echo $lb_pick_container_from;?></td> 
		  </tr>
		  <tr>
              <td colspan ="3"><textarea rows="2" cols="53"></textarea></td>
		  </tr>
		  
		   <tr>
              <td colspan ="3">Return Container To: <?php echo $lb_return_container;?></td> 
		  </tr>
		  <tr>
              <td colspan ="3"><textarea rows="2" cols="53"></textarea></td>
		  </tr>
          <tr>
              <td colspan ="3">Notes</td> 
		  </tr>
		  <tr>
              <td colspan ="3"><textarea rows="2" cols="53"><?php echo $lb_notes;?></textarea></td>
		  </tr>
		  <tr><td>&nbsp;
          </tr>
           <tr><td>&nbsp;
          </tr>
	      <tr>
           <td ><input type="checkbox" value="lb_cancel" />Cancel </td><td> <input type="text" name="lb_date" value="<?php echo $lb_date;?>" size="15" /> </td>
           <td><input type="text" name="lb_by" value="<?php echo $lb_by;?>" size="15" /></td>
	      </tr>
	      
          </table>
          
          </td>
          <td>
          
          <table>
          <tr>
          <td>Carrier </td>
          </tr>
          <tr>
          <td colspan ="3"><input type="text" name="lb_carrier" value="<?php echo $lb_carrier;?>" size="48" /></td>
          </tr>
          <tr>
           <td >Container Size</td>
          <td>Booking</td>
          </tr>
          <tr>
              <td ><input type="text" name="lb_container_size" value="<?php echo $lb_container_size;?>" size="15" /></td>
	          <td><input type="text" name="lb_booking" value="<?php echo $lb_booking;?>" size="25" /></td>
	      </tr>
	      
	      <tr>
           <td >Phone</td>
          <td>Contact</td>
          </tr>
          <tr>
              <td ><input type="text" name="lb_phone" value="<?php echo $lb_phone;?>" size="15" /></td>
	          <td><input type="text" name="lb_contact" value="<?php echo $lb_contact;?>" size="25" /></td>
	      </tr>
	      <tr>
           <td >Vessel <?php echo $lb_vessel_code;?></td>
          <td></td>
          </tr>
          <tr>
              <td colspan ="2"><input type="text" name="lb_booking" value="<?php echo $lb_vessel;?>" size="48" /></td>
	      </tr>
	      <tr>
           <td >Origin</td>
          <td>Load</td>
          </tr>
          <tr>
              <td ><input type="text" name="lb_origin" value="<?php echo $lb_origin;?>" size="15" /></td>
	          <td><input type="text" name="lb_load_port" value="<?php echo $lb_load_port;?>" size="25" /></td>
	      </tr>
	      <tr>
           <td ></td>
          <td>Destination</td>
          </tr>
          <tr>
              <td><input type="checkbox" name="lb_stop_off" value="<?php echo $lb_stop_off;?>" size="15" />StopOff</td>
	          <td><input type="text" name="lb_destination" value="<?php echo $lb_destination;?>" size="25" /></td>
	      </tr>
	      
	      <tr>
           <td >Rotation </td>
          <td></td>
          </tr>
          <tr>
              <td colspan ="2"><input type="text" name="lb_rotation" value="<?php echo $lb_rotation;?>" size="48" /></td>
	      </tr>
	      
          <tr>
              <td colspan ="2"><input type="text" name="" value="" size="48" /></td>
	      </tr>
	      
	      <tr>
           <td >Service Contract</td>
          <td></td>
          </tr>
          <tr>
              <td colspan ="2"><input type="text" name="" value="" size="48" /></td>
	      </tr>
	      
	      <tr>
           <td >Sail Date</td>
          <td>AES Document Cutoff</td>
          </tr>
          <tr>
              <td ><input type="text" name="lb_sail_date" value="<?php echo $lb_sail_date;?>" size="15" /></td>
	          <td><input type="text" name="lb_doc_cut" value="<?php echo $lb_doc_cut;?>" size="25" /></td>
	      </tr>
	      
	      <tr>
           <td >ETA</td>
          <td>Latest Delivery/Rail Date</td>
          </tr>
          
          <tr>
              <td ><input type="text" name="lb_date" value="<?php echo $lb_date;?>" size="15" /></td>
	          <td><input type="text" name="lb_latest_delivery" value="<?php echo $lb_latest_delivery;?>" size="25" /></td>
	      </tr>
	      
          </table>         
           </td>
           </tr>
           </table>	 
    </div><!---booking-type --->      
	    
      </form>
  	</div>
  </div>
</div>
<script type="text/javascript">$('#tabs a').tabs();</script> 
<script type="text/javascript">window.onload(function() {location.reload();});</script>
<?php echo $footer; ?>
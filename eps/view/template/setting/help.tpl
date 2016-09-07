 <!-- Modal -->
  <div class="modal fade" id="helpModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none" >
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header"  style="background: #458070;" >
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title"  style="color:white;"><b><i>Help Items</b></i></h4>
        </div>
        <div class="modal-body">
          <div class="row header contact">
			<div class="col-lg-12" >
			<div class="table">
			<div class=".col-lg-12 col-md-12 col-sm-6" >
			
			 </div>
			<div class="row" >
			<table id="quick_keys" class="table table-bordered">
				<thead>
					<tr>
					<td colspan = '2'>Hot Key Reference Guide - <b>" Shift + H "</b></td>
					
					</tr>
				</thead>
				<tbody >
					
					<tr><td class="text-right">Clone the Last Quote</td><td>Control + Shift + 1</td></tr>
					<tr><td class="text-right">Clone the Last Booking</td><td>Control + Shift + 2</td></tr>
					<tr><td class="text-right">Use the Last Customer</td><td>Shift + 6</td></tr>
				 
				</tbody>
			 </table>
			 </div>
			  <div  class=".col-lg-10 .col-lg-offset-2  .col-md-10 .col-md-offset-2  .col-sm-6" >
			 	<div class="text-muted"><span>Use "Hot Keys" to speed it up. Click <a href="<?php echo HTTP_HELP;?>HotKeys" target="_blank">here</a> for more information about how to use Hot Keys.</a></span> </div>
			 </div><!-- end row -->
			</div> 
			   
			 </div> 
        </div>
        <div class="modal-footer">
         
          <button type="button" class="btn btn-default" data-dismiss="modal">Finished</button>
          
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal --> 
  
  <script type="text/javascript"><!--
function manageHelp(){	  $('#helpModal').modal('show');	  	}
//--></script> 

<script type="text/javascript">$(document).ready(function() {
		
		

		 shortcut.add("SHIFT+H",function() {
			
		manageHelp();	
		});

	});
	
	//--></script>
	
		

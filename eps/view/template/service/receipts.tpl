<div class=".col-lg-12 col-md-12 col-sm-6">
			<legend><?php echo $text_receiptdetail; ?></legend>
				<div class ="table-responsive">
        
          <table class="table table-bordered">
           
            
            <tr>
              <td><?php echo $entry_receipt_receipt; ?></td>
              <td><?php echo $entry_receipt_date; ?></td>
              <td><?php echo $entry_receipt_cfs; ?></td>
              <td><?php echo $entry_receipt_warehouse; ?></td>
              <td><?php echo $entry_receipt_pieces; ?></td>
              <td><?php echo $entry_receipt_lbs; ?></td>
              <td><?php echo $entry_receipt_cft; ?></td>
              <td><?php echo $entry_receipt_discrepancy; ?></td>
            </tr>
            
            <tr>
              <td><a href=''><?php echo $receipt_receipt; ?></a></td>
              <td><?php echo $receipt_date; ?></td>
              <td></td>
              <td><?php echo $receipt_date; ?></td>
              <td><?php echo $arrival_pcs; ?></td>
              <td><?php echo $arrival_weight; ?></td>
              <td><?php echo $arrival_cft; ?></td>
              <td><input type='text' disabled = 'true' placeholder='' name='entry_receipt_discrepancy' value='' size='15' /></td>
            </tr>
            
            <?php if ($arrivaldetail) { 
            $size = sizeof($arrivaldetail);
            for ($row = 0; $row < $size; $row++)
            {
            echo "<tr>";
            echo "<td><a href=''>".$arrivaldetail[$row]['receipt']."</a></td><td>".$arrivaldetail[$row]['datein']."</td>";
            echo "<td>".$arrivaldetail[$row]['warecfs']."</td><td>".$arrivaldetail[$row]['warehouse']."</td>";
            echo "<td>".$arrivaldetail[$row]['pcs']."</td><td>".$arrivaldetail[$row]['wgt']."</td>";
            echo "<td>".$arrivaldetail[$row]['cft']."</td><td><input type='text' disabled = 'true' placeholder='' name='entry_receipt_discrepancy' value='' size='15' /></td>";
            echo "</tr>";
           	}
          } ?>
                     
          </table>
            
            </div>
</div><!-- end "receipts" -->
          
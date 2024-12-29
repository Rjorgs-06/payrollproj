<?php

include('db_connect.php');


$user_role = isset($_SESSION['login_type']) ? $_SESSION['login_type'] : 'guest';
$user_name = isset($_SESSION['login_name']) ? $_SESSION['login_name'] : '';

$i = 1;


if ($user_role == 'employee') {
    $user_name_escaped = $conn->real_escape_string($user_name);
    $query = "SELECT w.*, w.employee_id as emp_id, e.* 
          FROM wages AS w 
          INNER JOIN employee_regular AS e ON w.employee_id = e.id 
          WHERE e.fullname = '$user_name_escaped'";
} else {

    $query = "SELECT w.*, w.id as wages_id, w.employee_id as emp_id, e.* 
          FROM wages AS w 
          INNER JOIN employee_regular AS e ON w.employee_id = e.id";
}

$wages_info = $conn->query($query);

?>

<style>
.table-responsive {
    border-top: 1px solid #ccc !important;
}

.table-responsive>div {
    max-height: 400px;
    /* Adjust as needed */
    overflow-y: auto;
}

thead th {
    position: sticky;
    top: 0;
    background-color: white;

    z-index: 10;
}

thead,
tr {
    outline: 1px solid #ccc !important;
}
</style>

<div class="container-fluid ">
    <div class="col-lg-12">
        <div class="card p-4" id="hello">
            <div class="card-header">
                <?php if ($user_role != 'employee') : ?>
                <button class="btn btn-success btn-sm btn-block col-md-2 float-right" type="button" id="export_excel">
                    <span class="fa fa-print"></span> Export Excel
                </button>
                <?php endif; ?>
            </div>
            <hr>
            <div>

                <div class="d-flex justify-content-center align-items-center " style="width: 100%;">
                    <img src="./assets/img/Evsu-L.png" alt="" style="height: 90px; width: 90px;" class="mx-4">


                    <div>
                        <h1 style="font-family: Times New Roman , Times, serif; font-size: 50px; font-weight: bold"
                            class=" text-center align-middle">
                            General Payroll
                        </h1>
                        <h3 style="font-family: Times New Roman , Times, serif" , class=" text-center align-middle">
                            Eastern Visayas State University
                        </h3>
                        <h5 style="font-family: Times New Roman , Times, serif" , class=" text-center align-middle">
                            Carigara - Campus
                        </h5>
                    </div>
                    <img src="./assets/img/BP.png" alt="" style="height: 100px; width: 100px;" class="mx-4">
                </div>
            </div>


            <div class="table-responsive">
                <div style="max-height: 400px; overflow-y: auto;">
                    <table class="table table-bordered table-hover">
                        <thead style="position: sticky; top: 0; left: 0; background-color: white">
                            <tr>
                                <th rowspan="3" class="text-center align-middle"> No</th>
                                <th rowspan="3" class="text-center align-middle">Name</th>
                                <th rowspan="3" class="text-center align-middle">Rank</th>
                                <th rowspan="3" class="text-center align-middle">Employee No.</th>
                                <th rowspan="3" class="text-center align-middle">Monthly Salary</th>
                                <th rowspan="3" class="text-center align-middle">PERA</th>
                                <th rowspan="3" class="text-center align-middle">Gross Amount Earned
                                </th>
                                <th colspan="18" class="text-center align-middle">Deductions</th>


                                <th colspan="1" rowspan="3" class="text-center align-middle">Other Deductions</th>




                                <th rowspan="3" class="text-center align-middle">Total Deduction</th>
                                <th rowspan="3" class="text-center align-middle">Net Salary</th>
                                <th rowspan="3" class="text-center align-middle">Net Received for
                                    <?php $currentDate = date('F');
                                    echo $currentDate;  ?>
                                    (1-15)</th>
                                <th rowspan="3" class="text-center align-middle">Signature of Employee
                                </th>
                                <th rowspan="3" class="text-center align-middle">Net Received for
                                    <?php $currentDate = date('F');
                                    echo $currentDate;  ?>
                                    (16-31)</th>
                                <th rowspan="3" class="text-center align-middle">Signature of Employee
                                </th>
                                <th rowspan="3" class="text-center align-middle action-col">Action</th>
                            </tr>
                            <tr>
                                <th colspan="3" class="text-center align-middle">PAGIBIG</th>
                                <th colspan="2" class="text-center align-middle">GSIS</th>
                                <th rowspan="2" class="text-center align-middle">SIF</th>
                                <th colspan="2" class="text-center align-middle">PhilHealth</th>
                                <th rowspan="2" class="text-center align-middle">Withholding Tax</th>
                                <th rowspan="2" class="text-center align-middle">PRG</th>
                                <th rowspan="2" class="text-center align-middle">CNL</th>
                                <th rowspan="2" class="text-center align-middle">EML</th>
                                <th rowspan="2" class="text-center align-middle">MPL</th>
                                <th rowspan="2" class="text-center align-middle">GFAL</th>
                                <th rowspan="2" class="text-center align-middle">CPL</th>
                                <th rowspan="2" class="text-center align-middle">HELP</th>
                                <th rowspan="2" class="text-center align-middle">CFI</th>
                                <th rowspan="2" class="text-center align-middle">CSB</th>
                            </tr>
                            <tr>
                                <th>PS</th>
                                <th>GS</th>
                                <th>MP3</th>
                                <th>PS</th>
                                <th>GS</th>
                                <th>PS</th>
                                <th>GS</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php

                            while ($row = $wages_info->fetch_assoc()) :
                            ?>
                            <tr>
                                <td class="text-center"><?php echo $i++; ?></td>
                                <td><?php echo $row['fullname']; ?></td>
                                <td><?php echo $row['position']; ?></td>
                                <td><?php echo $row['employee_id']; ?></td>
                                <td><?php echo $row['monthly_salary']; ?></td>
                                <td><?php echo $row['pera']; ?></td>
                                <td><?php echo $row['gross_amount_earned']; ?></td>

                                <!-- PAGIBIG -->
                                <td><?php echo $row['pagibig_ps']; ?></td>
                                <td><?php echo $row['pagibig_gs']; ?></td>
                                <td><?php echo $row['pagibig_mp3']; ?></td>

                                <!-- GSIS -->
                                <td><?php echo $row['gsis_ps']; ?></td>
                                <td><?php echo $row['gsis_gs']; ?></td>

                                <!-- SIF -->
                                <td><?php echo $row['sif']; ?></td>

                                <!-- PhilHealth -->
                                <td><?php echo $row['philhealth_ps']; ?></td>
                                <td><?php echo $row['philhealth_gs']; ?></td>

                                <!-- Withholding Tax -->
                                <td><?php echo $row['withholding_tax']; ?></td>

                                <!-- Other Deductions -->
                                <td><?php echo $row['prg']; ?></td>
                                <td><?php echo $row['cnl']; ?></td>
                                <td><?php echo $row['eml']; ?></td>
                                <td><?php echo $row['mpl']; ?></td>
                                <td><?php echo $row['gfal']; ?></td>
                                <td><?php echo $row['cpl']; ?></td>
                                <td><?php echo $row['help']; ?></td>
                                <td><?php echo $row['cfi']; ?></td>
                                <td><?php echo $row['csb']; ?></td>

                                <!-- Total Deductions and Net Salary -->
                                <td>

                                    <?php if ($row['bangus']) {
                                            echo $row['bangus'] . "(Bangus)";
                                        } ?>

                                    <?php if ($row['prawns']) {
                                            echo $row['prawns'] . "(Prawns)";
                                        } ?>

                                </td>
                                <td><?php echo $row['total_deductions']; ?></td>
                                <td><?php echo $row['net_salary']; ?></td>

                                <!-- Net Received and Employee Signatures -->
                                <td><?php echo $row['net_received1']; ?></td>
                                <td></td>
                                <td><?php echo $row['net_received2']; ?></td>
                                <td></td>

                                <!-- View Payroll Button -->
                                <td class="text-center action-col">
                                    <button class="btn btn-sm btn-outline-primary view_payroll" type="button"
                                        data-id="<?php echo isset($row['wages_id']) ? $row['wages_id'] : ''; ?>"
                                        data-employee_id="<?php echo isset($row['emp_id']) ? $row['emp_id'] : ''; ?>">
                                        <i class="fa fa-eye"></i>
                                    </button>

                                </td>
                            </tr>
                            <?php endwhile; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>




    <script type="text/javascript">
    $(document).ready(function() {
        $('#table').DataTable();
    });
    </script>
    <script type="text/javascript">
    $(document).ready(function() {
        $('#table').DataTable();


        $('#export_excel').click(function() {
            let table = document.querySelector("table");


            let clonedTable = table.cloneNode(true);
            $(clonedTable).find('.action-col').remove();

            let workbook = XLSX.utils.table_to_book(clonedTable, {
                sheet: "Sheet1"
            });
            XLSX.writeFile(workbook, "payroll_data.xlsx");
        });


        $('.view_payroll').click(function() {
            var id = $(this).attr('data-id');
            var employee_id = $(this).attr('data-employee_id');


            uni_modal("Employee Payslip", "view_payslip.php?id=" + id + "&employee_id=" +
                employee_id,
                "small", false);
        });


        $('.remove_payroll').click(function() {
            _conf("Are you sure to delete this payroll?", "remove_payroll", [$(this).attr(
                'data-id')]);
        });
    });

    function remove_payroll(id) {
        start_load();
        $.ajax({
            url: 'ajax.php?action=delete_payroll',
            method: "POST",
            data: {
                id: id
            },
            error: err => console.log(err),
            success: function(resp) {
                if (resp == 1) {
                    alert_toast("Employee's data successfully deleted", "success");
                    setTimeout(function() {
                        location.reload();
                    }, 1000);
                }
            }
        });
    }
    </script>
<?php

include('db_connect.php');

$user_role = isset($_SESSION['login_type']) ? $_SESSION['login_type'] : 'guest';
$user_name = isset($_SESSION['login_name']) ? $_SESSION['login_name'] : '';


?>

<style>
    .table-responsive {
        border-top: 1px solid #ccc !important;
    }

    .table-responsive>div {
        max-height: 400px;
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

<div class="container-fluid">
    <div class="col-lg-12">
        <div class="card p-4">
            <div class="card-header">
                <button class="btn btn-success btn-sm btn-block col-md-2 float-right" type="button" id="export_excel">
                    <span class="fa fa-print"></span> Export Excel
                </button>
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
                        <thead style="position: sticky; top: 0; left: 0; background-color: white;">
                            <tr>
                                <th rowspan="3" class="text-center align-middle">No</th>
                                <th rowspan="3" class="text-center align-middle">Name</th>
                                <th rowspan="3" class="text-center align-middle">Position</th>
                                <th colspan="6" class="text-center align-middle">WAGES</th>

                                <th rowspan="3" class="text-center align-middle">SSS Contribution</th>
                                <th rowspan="3" class="text-center align-middle">Total Deduction</th>
                                <th rowspan="3" class="text-center align-middle">Net Amount Due</th>
                                <th rowspan="3" class="text-center align-middle">Remarks</th>
                                <th colspan="3" rowspan="3" class="text-center align-middle">Actions</th>

                            </tr>

                            <tr>
                                <th colspan="1" rowspan="2" class="text-center align-middle">Number of Days Worked</th>
                                <th colspan="1" class="text-center align-middle">Rate per Hour</th>
                                <th colspan="1" class="text-center align-middle">Tardiness</th>
                                <th colspan="1" class="text-center align-middle">Overtime</th>
                                <th colspan="1" class="text-center align-middle">Undertime</th>
                                <th colspan="1" class="text-center align-middle">Grand Total Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $i = 1;
                            if ($user_role == 'employee') {
                                $user_name_escaped = $conn->real_escape_string($user_name);
                                $query = "SELECT w.*, w.employee_id as emp_id, e.* 
                                  FROM wages_cos AS w 
                                  INNER JOIN employee_cos AS e ON w.employee_id = e.id 
                                  WHERE e.fullname = '$user_name_escaped'";
                            } else {

                                $query = "SELECT w.*, w.employee_id as emp_id, e.* 
                                  FROM wages_cos AS w 
                                  INNER JOIN employee_cos AS e ON w.employee_id = e.id";
                            }

                            $wages_info = $conn->query($query);
                            while ($row = $wages_info->fetch_assoc()) :
                            ?>
                                <tr>
                                    <td class="text-center"><?php echo $i++; ?></td>
                                    <td><?php echo $row['fullname']; ?></td>
                                    <td><?php echo $row['position']; ?></td>
                                    <td><?php echo $row['days_work']; ?></td>
                                    <td><?php echo $row['rate_per_hour']; ?></td>
                                    <td><?php echo $row['tardiness']; ?></td>
                                    <td><?php echo $row['overtime']; ?></td>
                                    <td><?php echo $row['undertime']; ?></td>
                                    <td><?php echo $row['grand_total']; ?></td>
                                    <td><?php echo $row['sss']; ?></td>
                                    <td><?php echo $row['total_deduction']; ?></td>
                                    <td><?php echo $row['net_amount']; ?></td>
                                    <td></td>
                                    <!-- View Payroll Button -->
                                    <td class="text-center action-col">
                                        <button class="btn btn-sm btn-outline-primary view_payroll"
                                            data-id="<?php echo $row['id'] ?>" type="button">
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
        $('#export_excel').click(function() {
            let table = document.querySelector("table");
            let clonedTable = table.cloneNode(true);

            // Remove any rowspan or colspan attributes from the cloned table headers
            $(clonedTable).find('th').each(function() {
                $(this).removeAttr('rowspan');
                $(this).removeAttr('colspan');
            });

            let workbook = XLSX.utils.table_to_book(clonedTable, {
                sheet: "Sheet1"
            });
            XLSX.writeFile(workbook, "payroll_data.xlsx");
        });

        $(document).ready(function() {
            $('.view_payroll').click(function() {
                var id = $(this).attr('data-id');

                uni_modal("Employee Payslip", "Payslip/cos.php?id=" + id + "&employee_id=" +
                    id,
                    "small", false);
            });

        });
    </script>
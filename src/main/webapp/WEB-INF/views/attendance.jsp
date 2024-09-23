<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Attendance Management System">
    <meta name="author" content="Your Name">
    <meta name="keywords" content="Attendance, Management, System">
    <title>Attendance Page</title>
    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 500px;
            margin: 50px auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border: 1px solid #e1e4e8;
        }
        .card-header {
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 20px;
            text-align: center;
            color: #007bff;
        }
        .form-label {
            font-weight: 500;
            margin-bottom: 8px;
            display: block;
            color: #333;
        }
        .form-control, .form-select {
            border-radius: 6px;
            border: 1px solid #ced4da;
            padding: 12px;
            margin-bottom: 20px;
            width: 100%;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }
        .form-control:focus, .form-select:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
        }
        .btn {
            display: inline-block;
            padding: 12px 24px;
            font-size: 16px;
            font-weight: 600;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            transition: background-color 0.3s ease, transform 0.2s ease;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .btn:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
        .btn:active {
            background-color: #004494;
            transform: scale(1);
        }
        .text-center {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="card-header">
            Student Attendance
        </div>
        <div class="card-body">
            <form id="attendanceForm">
                <div class="mb-3">
                    <label for="enqid" class="form-label">Enquiry ID</label>
                    <input type="text" class="form-control" id="enqid" name="enqid" placeholder="Enter the Enquiry ID *" required>
                </div>
                <div class="mb-3">
                    <label for="date" class="form-label">Date of Attendance</label>
                    <input type="date" class="form-control" id="date" name="date" required>
                </div>
                <div class="mb-3">
                    <label for="attendance" class="form-label">Attendance Status</label>
                    <select id="attendance" name="attendance" class="form-select" required>
                        <option value="" disabled selected>Select Attendance Status *</option>
                        <option value="Present">Present</option>
                        <option value="Absent">Absent</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="class" class="form-label">Class</label>
                    <select id="class" name="class" class="form-select" required>
                        <option value="" disabled selected>Select Class *</option>
                        <option value="1">1st Grade</option>
                        <option value="2">2nd Grade</option>
                        <option value="3">3rd Grade</option>
                        <option value="4">4th Grade</option>
                        <option value="5">5th Grade</option>
                        <option value="6">6th Grade</option>
                        <option value="7">7th Grade</option>
                        <option value="8">8th Grade</option>
                        <option value="9">9th Grade</option>
                        <option value="10">10th Grade</option>
                        <option value="11">11th Grade</option>
                        <option value="12">12th Grade</option>
                    </select>
                </div>
                <div class="text-center">
                    <button type="button" class="btn" id="submitAttendance">Submit</button>
                </div>
            </form>
        </div>
    </div>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.all.min.js"></script>
    <!-- Custom JS -->
    <script>
        $(document).ready(function() {
            $('#submitAttendance').click(function() {
                var enqid = $("#enqid").val();
                var date = $("#date").val();
                var attendance = $("#attendance").val();
                var classId = $("#class").val();
                
                $.ajax({
                    type: "POST",
                    url: "submitAttendance",
                    data: {
                        'enqid': enqid,
                        'date': date,
                        'attendance': attendance,
                        'class': classId
                    },
                    success: function(response) {
                        Swal.fire({
                            icon: 'success',
                            title: 'Success',
                            text: 'Attendance recorded successfully!',
                            confirmButtonText: 'OK'
                        });
                    },
                    error: function(response) {
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: 'Error recording attendance.',
                            confirmButtonText: 'OK'
                        });
                    }
                });
            });
        });
    </script>
</body>
</html>

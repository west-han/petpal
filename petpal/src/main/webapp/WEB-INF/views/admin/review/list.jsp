<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0/css/bootstrap.min.css">


<style type="text/css">
.body-container {
	max-width: 1300px;
	margin-top: 140px;
	margin-left: 80px;
}
.body-title h3{
	font-size: 26px;
}
.filters {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 20px;
}
.filters .form-check {
    margin-right: 20px;
}
.filters select, .filters input[type="text"] {
    padding: 5px 10px;
    margin-right: 10px;
}
.filters button {
    padding: 5px 10px;
}
</style>

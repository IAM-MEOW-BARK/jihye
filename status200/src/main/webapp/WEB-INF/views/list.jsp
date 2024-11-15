<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<%@ include file="include/head.jsp" %>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  
  <%@ include file="include/main_header.jsp" %>
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->

	<nav class="topmenu">
        <ul class="nav">
            <li><a href="#" class="link"> 공지사항 </a></li> 
            <li><a href="#" class="link"> 리뷰게시판 </a></li> 
            <li><a href="#" class="link"> Q/A </a></li> 
            <li><a href="#" class="link"> 자주묻는질문 </a></li>
        </ul>
    </nav>
    <!-- Main content -->
    <section class="content container-fluid">
		 <div>${msg}</div>
		<div class="table-responsive">
		  <table class="table">
		  <tr>
		  	<td>No</td>
		  	<td>제목</td>
		  	<td>등록일</td>
		  	<td>조회수</td>
		  </tr>
		<c:forEach var="board" items="${list }">
		 	<tr>
		 	<td>${board.bno}</td>
		 	<td><a href="detail?bno=${board.bno}"> ${board.title} </a></td>
		 	<td>${board.regdate}</td>
		 	<td>${board.id}</td>
		 	<td><span class="badge">${board.readcnt }</span></td>
		 	</tr>
		</c:forEach>
		
		<tr>
			<td colspan="4" align="right">
				<input class="btn btn-success" type="button" value="글 작성"	id="main" />		
			</td>
		</tr>
		  </table>
		  
		<c:if test="${pageListNUM>1}">
        <a href="list?pageListNUM=${pageListNUM-1}&pageNUM=${pageListNUM*10-10}"> 이전 </a>
        </c:if>
           
        <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <a href="list?pageListNUM=${pageListNUM }&pageNUM=${i }"> ${i } </a>
        </c:forEach>
        
        <c:if test="${pageListNUM<(totalPage/10)}">
        <a href="list?pageListNUM=${pageListNUM+1}&pageNUM=${pageListNUM*10+1}"> 다음 </a>
        </c:if>
        
		</div>
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <%@ include file="include/main_footer.jsp" %>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Create the tabs -->
    <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
      <li class="active"><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
      <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
    </ul>
    <!-- Tab panes -->
    <div class="tab-content">
      <!-- Home tab content -->
      <div class="tab-pane active" id="control-sidebar-home-tab">
        <h3 class="control-sidebar-heading">Recent Activity</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <i class="menu-icon fa fa-birthday-cake bg-red"></i>

              <div class="menu-info">
                <h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

                <p>Will be 23 on April 24th</p>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

        <h3 class="control-sidebar-heading">Tasks Progress</h3>
        <ul class="control-sidebar-menu">
          <li>
            <a href="javascript:;">
              <h4 class="control-sidebar-subheading">
                Custom Template Design
                <span class="pull-right-container">
                    <span class="label label-danger pull-right">70%</span>
                  </span>
              </h4>

              <div class="progress progress-xxs">
                <div class="progress-bar progress-bar-danger" style="width: 70%"></div>
              </div>
            </a>
          </li>
        </ul>
        <!-- /.control-sidebar-menu -->

      </div>
      <!-- /.tab-pane -->
      <!-- Stats tab content -->
      <div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>
      <!-- /.tab-pane -->
      <!-- Settings tab content -->
      <div class="tab-pane" id="control-sidebar-settings-tab">
        <form method="post">
          <h3 class="control-sidebar-heading">General Settings</h3>

          <div class="form-group">
            <label class="control-sidebar-subheading">
              Report panel usage
              <input type="checkbox" class="pull-right" checked>
            </label>

            <p>
              Some information about this general settings option
            </p>
          </div>
          <!-- /.form-group -->
        </form>
      </div>
      <!-- /.tab-pane -->
    </div>
  </aside>
  <!-- /.control-sidebar -->
  <!-- Add the sidebar's background. This div must be placed
  immediately after the control sidebar -->
  <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
<%@ include file="include/plugin_js.jsp" %>
</body>
</html>
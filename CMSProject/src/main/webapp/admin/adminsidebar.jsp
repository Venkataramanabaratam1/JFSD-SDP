<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<div class="dlabnav">
            <div class="dlabnav-scroll">
                <ul class="metismenu" id="menu">
                    <li class="nav-label first">Main Menu</li>
                    <li><a class="ai-icon" href="../adminhome">
							<i class="la la-home"></i>
							<span class="nav-text">Dashboard</span>
						</a>
                    </li>
					<li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
							<i class="la la-user"></i>
							<span class="nav-text">Professors</span>
						</a>
                        <ul aria-expanded="false">
                            <li><a href="all-professors">All Professors</a></li>
                            <li><a href="add-professor">Add Professor</a></li>
                            <li><a href="professor-issue">Professor Issue</a></li>
                        </ul>
                    </li>
					<li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
							<i class="la la-users"></i>
							<span class="nav-text">Students</span>
						</a>
                        <ul aria-expanded="false">
                            <li><a href="all-students">All Students</a></li>
                            <li><a href="add-student">Add Student</a></li>
                            <li><a href="student-issue">Student Issue</a></li>
                        </ul>
                    </li>
					<li><a class="has-arrow" href="javascript:void()" aria-expanded="false">
							<i class="la la-graduation-cap"></i>
							<span class="nav-text">Courses</span>
						</a>
                        <ul aria-expanded="false">
                            <li><a href="all-courses">All Courses</a></li>
                            <li><a href="add-course">Add Course</a></li>         
                            <li><a href="StudentRegisteredCourses">Student Registered Courses</a></li>
                            <li><a href="FacultyRegisteredCourses">Faculty Assigned Course</a></li>                           
                        </ul>
                    </li>				
                    <li><a class="ai-icon" href="../index">
                        <i class="la la-sign-out"></i>
                        <span class="nav-text">Log out</span>
                    </a>
                    </li>
				</ul>
            </div>
        </div>
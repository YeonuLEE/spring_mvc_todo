<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
            crossorigin="anonymous"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand">Navbar</a>
    </div>
    </div>
</nav>
<section style="padding: 15px">
    <h5>Search</h5>
    <form action="/search">
        <input type="hidden" name="page" value="${pageRequestDTO.page}">
        <input type="hidden" name="size" value="${pageRequestDTO.size}">
        <div class="form-check">
            <input class="form-check-input" type="checkbox" name="finished">
            <label class="form-check-label">
                완료여부
            </label>
        </div>
        <br>
        <div>
            <input class="form-check-input" type="checkbox" value="t" name="types">
            <label class="form-check-label">
                제목
            </label>
            <input class="form-check-input" type="checkbox" value="w" name="types">
            <label class="form-check-label">
                작성자
            </label>
        </div>
        <br>
        <div class="form-floating mb-3">
            <input type="text" class="form-control" id="floatingInput" placeholder="검색내용" name="searchContent" <c:out
                    value=""/>>
            <label for="floatingInput">검색내용</label>
        </div>
        <div class="input-group input-daterange">
            <input type="date" class="form-control" name="startDate" value="">
            <div class="input-group-addon"></div>
            <input type="date" class="form-control" name="endDate" value="">
        </div>
        <br>
        <input type="submit" class="btn btn-primary" value="Search">
        <input type="reset" class="btn btn-info" value="Clear">
    </form>
</section>
<section style="padding: 15px">

    <nav class="navbar-expand-lg bg-light">
        <div class="container-fluid">
            <b>Featured</b>
            <button type="button" class="btn btn-primary" onclick="location.href='/register'">Register</button>
        </div>
    </nav>
    <div style="margin: 10px; font-size: 20px">Todo List</div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Tno</th>
            <th scope="col">Title</th>
            <th scope="col">Writer</th>
            <th scope="col">DueDate</th>
            <th scope="col">Finished</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${todoList.dtoList}" var="dto">
            <tr>
                <th scope="row"><c:out value="${dto.tno}"/></th>
                <td>
                    <a href="/view?tno=${dto.tno}&${pageRequestDTO.link}" class="text-decoration- none"
                       data-tno="${dto.tno}">
                        <c:out value="${dto.title}"/> </a>
                </td>
                <td><c:out value="${dto.writer}"/></td>
                <td><c:out value="${dto.dueDate}"/></td>
                <td><c:out value="${dto.finished}"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="float-end">
        <ul class="pagination flex-wrap">
            <c:if test="${todoList.prev}">
                <li class="page-item">
                    <a class="page-link" data-num="${todoList.start -1}">Previous</a>
                </li>
            </c:if>

            <c:forEach begin="${todoList.start}" end="${todoList.end}" var="num">
                <li class="page-item ${todoList.page == num? "active":""} ">
                    <a class="page-link" data-num="${num}"> ${num} </a>
                </li>
            </c:forEach>

            <c:if test="${todoList.next}">
                <li class="page-item">
                    <a class="page-link" data-num="${todoList.end + 1}">Next</a>
                </li>
            </c:if>
        </ul>
    </div>
</section>

<script>
    document.querySelector(".pagination").addEventListener("click", function (e) {
        e.preventDefault()
        e.stopPropagation()

        const target = e.target

        if (target.tagName !== 'A') {
            return
        }

        const num = target.getAttribute("data-num")
        // const formObj = document.querySelector("form")
        //
        // formObj.innerHTML += `<input type='hidden' name='page' value='\${num}'>`
        //
        // formObj.submit();

        const types = "<c:out value='<%=request.getParameter("types")%>'/>";
        const searchContent = "<c:out value='<%=request.getParameter("searchContent")%>'/>";
        const startDate = "<c:out value='<%=request.getParameter("startDate")%>'/>";
        const endDate = "<c:out value='<%=request.getParameter("endDate")%>'/>";

        if(startDate == "") {
            self.location = self.location = `/list?page=\${num}`;
        }
        else {
            self.location = `/search?page=\${num}&size=10&types=\${types}&searchContent=\${searchContent}&startDate=\${startDate}&endDate=\${endDate}`;
        }
    }, false)

</script>

</body>
</html>
<!doctype html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <meta charset="utf-8">
        <title>Spring MVC Application</title>

        <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="http://getbootstrap.com/dist/css/bootstrap-responsive.min.css" rel="stylesheet">
    </head>

    <body>
        <div class="container">
            <c:if test="${!empty tactics}">
                <h3>Tactics</h3>
                <table class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Category</th>
                            <th>Minimap</th>
                            <th>Level</th>
                            <th>Side</th>
                            <th>Difficulty</th>
                            <th>Author</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${tactics}" var="tactic">
                            <tr>
                                <td>${tactic.id}</td>
                                <td>${tactic.name}</td>
                                <td>${tactic.description}</td>
                                <td>${tactic.category}</td>
                                <td>${tactic.minimap}</td>
                                <td>${tactic.level}</td>
                                <td>${tactic.side}</td>
                                <td>${tactic.difficulty}</td>
                                <td>${tactic.author}</td>
                                <td>
                                    <form:form action="delete/${tactic.id}" method="post"><input type="submit"
                                                                                               class="btn btn-danger btn-mini"
                                                                                               value="Delete"/>
                                    </form:form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </body>
</html>
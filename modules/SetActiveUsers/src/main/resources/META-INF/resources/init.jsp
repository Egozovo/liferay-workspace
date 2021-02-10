<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %><%@
taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %><%@
taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %><%@
taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<%@ page import="com.liferay.portal.kernel.dao.search.SearchContainer" %>
<%@ page import="com.liferay.portal.kernel.service.UserLocalService" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.liferay.portal.kernel.model.Phone" %>
<%@ page import="com.liferay.portal.kernel.model.Organization" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.portlet.PortletURL" %>
<liferay-theme:defineObjects />

<portlet:defineObjects />


<%
UserLocalService userLocalService = (UserLocalService)request.getAttribute("userLocalService");
%>
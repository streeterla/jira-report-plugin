<%@ taglib uri="webwork" prefix="webwork" %>
<%@ taglib uri="jiratags" prefix="jira" %>
<%@ taglib uri="sitemesh-page" prefix="page" %>

<html>
<head>
	<title><webwork:text name="'admin.schedulerdetails.scheduler.administration'"/></title>
</head>

<body>

<page:applyDecorator name="jirapanel">
    <page:param name="title"><webwork:text name="'admin.schedulerdetails.scheduler.administration'"/></page:param>
    <page:param name="description">
        <webwork:text name="'admin.schedulerdetails.page.description'"/>
    </page:param>
    <page:param name="width">100%</page:param>

    <webwork:property value="scheduler/metaData">
    <p>
        <webwork:text name="'admin.schedulerdetails.quartz.scheduler'">
            <webwork:param name="'value0'"><b><webwork:property value="schedulerName" /></b></webwork:param>
            <webwork:param name="'value1'"><b><webwork:property value="schedulerInstanceId" /></b></webwork:param>
        </webwork:text><br>
        <webwork:text name="'admin.schedulerdetails.scheduler.has.been.running.since'">
            <webwork:param name="'value0'"><b><webwork:property value="/outlookDate/formatDMYHMS(runningSince)" /></b></webwork:param>
            <webwork:param name="'value1'"><b><webwork:property value="numJobsExecuted" /></b></webwork:param>
        </webwork:text><br>
        <webwork:text name="'admin.schedulerdetails.job.store.is.class'">
            <webwork:param name="'value0'"><b><webwork:property value="jobStoreClass" /></b></webwork:param>
        </webwork:text> <webwork:if test="jobStoreSupportsPersistence == false"><webwork:text name="'admin.schedulerdetails.this.class.does.not.support.persistence'"/></webwork:if><webwork:else><webwork:text name="'admin.schedulerdetails.this.class.supports.persistence'"/></webwork:else><br>
        <webwork:text name="'admin.schedulerdetails.the.thread.pool'">
            <webwork:param name="'value0'"><b><webwork:property value="threadPoolClass" /></b></webwork:param>
            <webwork:param name="'value1'"><b><webwork:property value="threadPoolSize" /></b></webwork:param>
        </webwork:text><br>
    </p>
    <p>
        <webwork:text name="'admin.schedulerdetails.paused'"/>:
        <webwork:if test="paused == true"><font color="#009900"><webwork:text name="'admin.common.words.true'"/></font></webwork:if>
        <webwork:else><font color="#990000"><webwork:text name="'admin.common.words.false'"/></font></webwork:else><br>
        <webwork:text name="'admin.schedulerdetails.shutdown'"/>:
        <webwork:if test="shutdown == true"><font color="#009900"><webwork:text name="'admin.common.words.true'"/></font></webwork:if>
        <webwork:else><font color="#990000"><webwork:text name="'admin.common.words.false'"/></font></webwork:else>
    </p>
    </webwork:property>
</page:applyDecorator>




<br>
<h3><webwork:text name="'admin.schedulerdetails.jobs'"/></h3>
<hr>

<table width="100%" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0"><tr><td>
<table border="0" cellpadding="3" cellspacing="1" width="100%">
	<tr bgcolor=#f0f0f0>
        <td class="colHeaderLink" width="25%">
			<b><webwork:text name="'common.words.name'"/></b>
		</td>
		<td class="colHeaderLink" width="55%">
			<b><webwork:text name="'admin.schedulerdetails.class'"/></b>
		</td>
		<td class="colHeaderLink" width="20%">
			<b><webwork:text name="'admin.common.words.attributes'"/></b>
		</td>
	</tr>

<webwork:iterator value="scheduler/jobGroupNames" status="'outerstatus'">
    <tr bgcolor=#ffffff>
        <td colspan=4>
            <webwork:if test="@outerstatus/first == false">&nbsp;<br></webwork:if>
            <b><webwork:text name="'admin.schedulerdetails.group'"/>: <webwork:property value="." /></b>
        </td>
    </tr>

        <webwork:iterator value="/scheduler/jobNames(.)" status="'status'">
        <webwork:property value="/scheduler/jobDetail(., ..)">
            <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
                <td valign=top>
                    <webwork:property value="name" />
                </td>
                <td valign=top>
                    <webwork:property value="jobClass/name" />
                </td>
                <td valign=top>
                    <webwork:text name="'admin.schedulerdetails.volatile'"/>:
                    <webwork:if test="volatile == true"><font color="#009900"><webwork:text name="'admin.common.words.true'"/></font></webwork:if>
                    <webwork:else><font color="#990000"><webwork:text name="'admin.common.words.false'"/></font></webwork:else><br>
                    <webwork:text name="'admin.schedulerdetails.durable'"/>:
                    <webwork:if test="durable == true"><font color="#009900"><webwork:text name="'admin.common.words.true'"/></font></webwork:if>
                    <webwork:else><font color="#990000"><webwork:text name="'admin.common.words.false'"/></font></webwork:else><br>
                    <webwork:text name="'admin.schedulerdetails.stateful'"/>:
                    <webwork:if test="stateful == true"><font color="#009900"><webwork:text name="'admin.common.words.true'"/></font></webwork:if>
                    <webwork:else><font color="#990000"><webwork:text name="'admin.common.words.false'"/></font></webwork:else>
                </td>
            </tr>
        </webwork:property>
        </webwork:iterator>

</webwork:iterator>
    </table>
</td></tr></table>

</p>

<br>
<h3><webwork:text name="'admin.schedulerdetails.triggers'"/></h3>
<hr>

<table width="100%" bgcolor="#bbbbbb" border="0" cellpadding="0" cellspacing="0"><tr><td>
<table border="0" cellpadding="3" cellspacing="1" width="100%">
	<tr bgcolor=#f0f0f0>
        <td class="colHeaderLink" width="25%">
			<b><webwork:text name="'common.words.name'"/></b>
		</td>
		<td class="colHeaderLink" width="40%">
			<b><webwork:text name="'admin.schedulerdetails.job'"/></b>
		</td>
        <td class="colHeaderLink" width="15%">
			<b><webwork:text name="'admin.schedulerdetails.next.fire'"/></b>
		</td>
		<td class="colHeaderLink" width="20%">
			<b><webwork:text name="'admin.common.words.attributes'"/></b>
		</td>
	</tr>

<webwork:iterator value="scheduler/triggerGroupNames" status="'outerstatus'">
   <tr bgcolor=#ffffff>
        <td colspan=4>
            <webwork:if test="@outerstatus/first == false">&nbsp;<br></webwork:if>
            <b><webwork:text name="'admin.schedulerdetails.group'"/>: <webwork:property value="." /></b>
        </td>
    </tr>

        <webwork:iterator value="/scheduler/triggerNames(.)" status="'status'">
        <webwork:property value="/scheduler/trigger(., ..)">
            <tr bgcolor="#<webwork:if test="@status/modulus(2) == 1">ffffff</webwork:if><webwork:else>fffff0</webwork:else>">
                <td>
                    <webwork:property value="name" />
                </td>
                <td>
                    <webwork:property value="fullJobName" />
                </td>
                <td nowrap>
                    <webwork:property value="/outlookDate/formatDMYHMS(nextFireTime)" />
                </td>
                <td>
                    <webwork:text name="'admin.schedulerdetails.volatile'"/>:
                    <webwork:if test="volatile == true"><font color="#009900"><webwork:text name="'admin.common.words.true'"/></font></webwork:if>
                    <webwork:else><font color="#990000"><webwork:text name="'admin.common.words.false'"/></font></webwork:else>
                </td>
            </tr>
        </webwork:property>
        </webwork:iterator>

</webwork:iterator>
    </table>
</td></tr></table>

</p>

</body>
</html>

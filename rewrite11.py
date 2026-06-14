import re

with open('src/main/webapp/motorbikeManagement.jsp', 'r', encoding='utf-8') as f:
    content = f.read()

# Fix header "Kho Xe (Realtime)" to "Kho Xe"
content = content.replace('<th scope="col">Kho Xe (Realtime)</th>', '<th scope="col">Kho Xe</th>')

# Fix availCount calculation
old_avail = '''<c:set var="mID" value="${m.motorcycleId}" />
                                                    <c:set var="availString" value="${mapA[mID]}" />
                                                    <c:set var="availCount" value="0" />
                                                    <c:if test="${not empty availString}">
                                                        <c:set var="availArray" value="${fn:split(availString, ',')}" />
                                                        <c:set var="availCount" value="${fn:length(availArray)}" />
                                                    </c:if>'''

new_avail = '''<c:set var="mID" value="${m.motorcycleId}" />
                                                    <c:set var="availCount" value="${not empty mapA[mID] ? mapA[mID] : 0}" />'''

content = content.replace(old_avail, new_avail)

with open('src/main/webapp/motorbikeManagement.jsp', 'w', encoding='utf-8') as f:
    f.write(content)

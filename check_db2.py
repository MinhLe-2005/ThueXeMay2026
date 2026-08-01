import psycopg2
import sys

sys.stdout.reconfigure(encoding='utf-8')
conn = psycopg2.connect(host='aws-1-ap-northeast-1.pooler.supabase.com', port=6543, user='postgres.zfvgigfjmbtgwgirdify', password='Bimdiendie1@', dbname='postgres')
cur = conn.cursor()
sql = """SELECT c."CustomerID", a."FullName", a."Email", a."Phone", COUNT(b."BookingID") AS "TotalBookings", SUM(bd."TotalPrice") AS "TotalSpent" 
FROM "Customer" c 
JOIN "Account" a ON c."AccountID" = a."AccountID" 
JOIN "Booking" b ON c."CustomerID" = b."CustomerID" 
JOIN "Booking Detail" bd ON b."BookingID" = bd."BookingID" 
WHERE b."StatusBooking" = 'Đã hoàn thành' OR (b."StatusBooking" = 'Đã xác nhận' AND b."DeliveryStatus" = 'Đã trả') 
GROUP BY c."CustomerID", a."FullName", a."Email", a."Phone" 
ORDER BY "TotalSpent" DESC, "TotalBookings" DESC 
LIMIT 20"""
cur.execute(sql)
print(cur.fetchall())

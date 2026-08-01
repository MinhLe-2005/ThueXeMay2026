import psycopg2

conn = psycopg2.connect(
    host="aws-1-ap-northeast-1.pooler.supabase.com",
    port=6543,
    database="postgres",
    user="postgres.zfvgigfjmbtgwgirdify",
    password="Bimdiendie1@"
)
conn.autocommit = True
cur = conn.cursor()

try:
    cur.execute('ALTER TABLE "Voucher" ADD COLUMN "MinSpend" DECIMAL(10,3) DEFAULT 0')
    print("Added MinSpend")
except Exception as e:
    print(e)

try:
    cur.execute('ALTER TABLE "Voucher" ADD COLUMN "MaxDiscount" DECIMAL(10,3) DEFAULT 0')
    print("Added MaxDiscount")
except Exception as e:
    print(e)

cur.close()
conn.close()

## 1. What is PostgreSQL?

PostgreSQL একটি ওপেন সোর্স রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম যা ডাটা স্টোরেজ এবং ম্যানেজমেন্টের জন্য ব্যবহৃত হয়। এটি  Structured Query Language ব্যবহার করে ডেটাবেস পরিচালনা করে, এর মধ্যে রয়েছে ট্রানজেকশন সাপোর্ট, কনকারেন্সি কন্ট্রোল, ডেটা ইনটিগ্রিটি সহ আরও অনেক ফিচার।


## 2. What is the purpose of a database schema in PostgreSQL?

PostgreSQL-এ স্কিমা একটি নামস্পেস হিসেবে কাজ করে, যেখানে টেবিল, ভিউ, ফাংশন এবং অন্যান্য অবজেক্টগুলো গোষ্ঠীভুক্ত থাকে। এটি ডাটাবেসের মধ্যে বিভিন্ন ডেটা কাঠামোকে আলাদা করার পাশাপাশি একাধিক ব্যবহারকারীর জন্য নিরাপত্তা ও অ্যাক্সেস কন্ট্রোলও নিশ্চিত করে।


## 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

 Primary Key এটি একটি টেবিলের এমন একটি কলাম বা কলামগুলির সংমিশ্রণ যা প্রতিটি রেকর্ডকে ইউনিকভাবে চিহ্নিত করে। একটি টেবিলের মধ্যে একমাত্র Primary Key থাকতে পারে।

 Foreign Key এটি একটি টেবিলের কলাম বা কলামগুলির সেট যা অন্য একটি টেবিলের Primary Key কে রেফারেন্স করে। Foreign Key সম্পর্কযুক্ত টেবিলগুলির মধ্যে সম্পর্ক তৈরি করে।


## 4. What is the difference between the VARCHAR and CHAR data types?

 VARCHAR হলো একটি ভ্যারিয়েবল-লেন্থ স্ট্রিং ডেটা টাইপ, যার মানে হল, এই কলামের স্টোরেজ প্রয়োজনীয়তা তার মানের দৈর্ঘ্যের ওপর ভিত্তি করে পরিবর্তিত হয়।
 অন্যদিকে, CHAR হলো একটি স্থির-লেন্থ স্ট্রিং ডেটা টাইপ। এর মানে হল, কলামে প্রতিটি মান নির্দিষ্ট দৈর্ঘ্যেই থাকবে যদি কম দৈর্ঘ্যের স্ট্রিং দেয়া হয় তবে তা ফাঁকা স্থান দিয়ে পূর্ণ হয়ে যাবে।


## 5. Explain the purpose of the WHERE clause in a SELECT statement.

WHERE ক্লজটি SELECT স্টেটমেন্টে ব্যবহার করা হয় যাতে একটি নির্দিষ্ট শর্ত পূর্ণ করার জন্য রেকর্ডগুলি ফিল্টার করা যায়। এটি ডাটাবেস থেকে কেবলমাত্র সেই রেকর্ডগুলি ফেরত দেয় যা শর্তের সাথে মিলে।


## 6. What are the LIMIT and OFFSET clauses used for?

LIMIT: এটি একটি কুয়েরি থেকে ফেরত দেওয়া রেকর্ডের সংখ্যা সীমাবদ্ধ করতে ব্যবহৃত হয়। LIMIT 5 কেবলমাত্র ৫টি রেকর্ড ফেরত দিবে।
OFFSET: এটি কুয়েরির ফলাফল থেকে শুরু করার স্থান নির্ধারণ করে। OFFSET 10 প্রথম ১০টি রেকর্ড বাদ দিয়ে পরবর্তী রেকর্ডগুলি ফেরত দিবে।


## 7. How can you modify data using UPDATE statements?

UPDATE স্টেটমেন্ট ব্যবহার করে একটি নির্দিষ্ট টেবিলের ডেটা পরিবর্তন করা হয়। এটি সাধারণত SET ক্লজ ব্যবহার করে নতুন মান নির্ধারণ করে এবং WHERE ক্লজ দিয়ে নির্দিষ্ট রেকর্ডগুলি চিহ্নিত করে।
   ```bash
   UPDATE books
   SET price = 19.99
   WHERE id = 1;
   ```

## 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?

JOIN অপারেশন দুটি বা তার বেশি টেবিলের মধ্যে সম্পর্ক স্থাপন করতে ব্যবহৃত হয়। এটি টেবিলগুলির মধ্যে সম্পর্কিত ডেটা একত্রিত করে একটি একক ফলাফল সেট তৈরি করে। PostgreSQL-এ বিভিন্ন ধরনের JOIN রয়েছে, যেমন INNER JOIN, LEFT JOIN, RIGHT JOIN যা বিভিন্ন ধরণের সম্পর্ক প্রকাশ করে।


## 9. Explain the GROUP BY clause and its role in aggregation operations.

GROUP BY ক্লজটি ব্যবহৃত হয় ডেটাকে একটি নির্দিষ্ট কলামের মানের ভিত্তিতে গ্রুপ করতে। এটি সাধারণত Aggregate ফাংশনগুলির সাথে ব্যবহৃত হয়। যেমন COUNT(), SUM(), AVG() ইত্যাদি।

## 10. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?

COUNT(): এটি একটি নির্দিষ্ট কলামে অথবা রেকর্ডের মধ্যে সংখ্যার গণনা করে।
SUM(): এটি একটি নির্দিষ্ট সংখ্যামূলক কলামের মোট যোগফল হিসাব করে।
AVG(): এটি একটি নির্দিষ্ট সংখ্যামূলক কলামের গড় মান হিসাব করে।
```bash
SELECT AVG(price) FROM books;
SELECT COUNT(id) FROM orders;
SELECT SUM(price) FROM books WHERE stock > 0;
```

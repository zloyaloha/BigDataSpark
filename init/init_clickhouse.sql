CREATE TABLE IF NOT EXISTS product_top10 (
    name String,
    brand String,
    category String,
    total_quantity UInt64,
    total_revenue Float64
) ENGINE = MergeTree()
ORDER BY total_revenue;

CREATE TABLE IF NOT EXISTS revenue_by_category (
    category String,
    total_revenue Float64
) ENGINE = MergeTree()
ORDER BY total_revenue;

CREATE TABLE IF NOT EXISTS avg_rating_reviews (
    name String,
    brand String,
    category String,
    avg_rating Float32,
    review_count UInt32
) ENGINE = MergeTree()
ORDER BY avg_rating;

CREATE TABLE IF NOT EXISTS top10_customers (
    customer_id UInt64,
    first_name String,
    last_name String,
    total_spent Float64,
) ENGINE = MergeTree()
ORDER BY total_spent;

CREATE TABLE IF NOT EXISTS country_distribution (
    country String,
    customer_count UInt64
) ENGINE = MergeTree()
ORDER BY customer_count;

CREATE TABLE IF NOT EXISTS avg_receipt (
    customer_id UInt64,
    first_name String,
    last_name String,
    email String,
    total_spent Float64,
    purchase_count UInt64,
    avg_receipt Float32
) ENGINE = MergeTree()
ORDER BY avg_receipt;

CREATE TABLE IF NOT EXISTS monthly_sales (
    year Int16,
    month Int8,
    total_revenue Float64
) ENGINE = MergeTree()
ORDER BY total_revenue;

CREATE TABLE IF NOT EXISTS yearly_sales (
    year Int16,
    total_revenue Float64
) ENGINE = MergeTree()
ORDER BY total_revenue;

CREATE TABLE IF NOT EXISTS monthly_avg_order (
    year Int16,
    month Int8,
    order_count Int32,
    total_revenue Float64,
    avg_order_value Float64
) ENGINE = MergeTree()
ORDER BY avg_order_value;

CREATE TABLE IF NOT EXISTS top5_stores (
    name String,
    location String,
    city String,
    total_revenue Float64,
) ENGINE = MergeTree()
ORDER BY total_revenue;

CREATE TABLE IF NOT EXISTS sales_by_location (
    city String,
    country String,
    total_revenue Float64,
    total_sales UInt64,
) ENGINE = MergeTree()
ORDER BY total_revenue;

CREATE TABLE IF NOT EXISTS avg_check_per_store (
    name String,
    location String,
    city String,
    avg_receipt Float64,
) ENGINE = MergeTree()
ORDER BY avg_receipt;

CREATE TABLE IF NOT EXISTS avg_unit_price_per_supplier (
    supplier_id UInt64,
    name String,
    contact String,
    email String,
    country String,
    total_revenue Float64,
    avg_unit_price Float32
) ENGINE = MergeTree()
ORDER BY avg_unit_price;

CREATE TABLE IF NOT EXISTS top5_suppliers (
    supplier_id UInt64,
    name String,
    contact String,
    email String,
    total_revenue Float64
) ENGINE = MergeTree()
ORDER BY total_revenue;

CREATE TABLE IF NOT EXISTS sales_by_country (
    country String,
    total_revenue_by_country Float64
) ENGINE = MergeTree()
ORDER BY total_revenue_by_country;

CREATE TABLE IF NOT EXISTS most_reviewed (
    name String,
    brand String,
    category String,
    avg_rating Float32,
    review_count UInt64,
    total_quantity_sold UInt64
) ENGINE = MergeTree()
ORDER BY (review_count);

CREATE TABLE IF NOT EXISTS least_reviewed (
    name String,
    brand String,
    category String,
    avg_rating Float32,
    review_count UInt64,
    total_quantity_sold UInt64
) ENGINE = MergeTree()
ORDER BY (review_count);

CREATE TABLE IF NOT EXISTS correlation (
    correlation Float64
) ENGINE = TinyLog;

CREATE TABLE IF NOT EXISTS top_rated (
    name String,
    brand String,
    category String,
    avg_rating Float32,
    review_count UInt64,
    total_quantity_sold UInt64
) ENGINE = MergeTree()
ORDER BY (avg_rating);

CREATE TABLE IF NOT EXISTS lowest_rated (
    name String,
    brand String,
    category String,
    avg_rating Float32,
    review_count UInt64,
    total_quantity_sold UInt64
) ENGINE = MergeTree()
ORDER BY (avg_rating);

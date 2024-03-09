CREATE TABLE cb_deposit_products (
   id            NUMBER
      GENERATED ALWAYS AS IDENTITY
   PRIMARY KEY,
   curency_id    NUMBER,
   product_name  VARCHAR2(100),
   term          NUMBER(4),
   interest_rate NUMBER(10, 2)
);

CREATE OR REPLACE PROCEDURE cb_deposit_products_insert (
   p_curency_id    NUMBER,
   p_product_name  VARCHAR2,
   p_term          NUMBER,
   p_interest_rate NUMBER
) IS
BEGIN
   INSERT INTO cb_deposit_products (
      curency_id,
      product_name,
      term,
      interest_rate
   ) VALUES (
      p_curency_id,
      p_product_name,
      p_term,
      p_interest_rate
   );

   COMMIT;
END;

CREATE OR REPLACE PROCEDURE cb_deposit_products_update (
   p_id            NUMBER,
   p_curency_id    NUMBER DEFAULT NULL,
   p_product_name  VARCHAR2 DEFAULT NULL,
   p_term          NUMBER DEFAULT NULL,
   p_interest_rate NUMBER DEFAULT NULL
) IS
BEGIN
   UPDATE cb_deposit_products
   SET
      curency_id = nvl(p_curency_id, curency_id),
      product_name = nvl(p_product_name, p_product_name),
      term = nvl(p_term, term),
      interest_rate = nvl(p_interest_rate, interest_rate)
   WHERE
      id = p_id;

   COMMIT;
END;
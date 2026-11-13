-- 八吉祥：課程方案改成「分類篩選＋課程卡」需要的欄位
-- 到 Supabase → SQL Editor → New query，貼上全部內容按 Run。可重複執行。

alter table public.courses add column if not exists status text;            -- 招生中／即將開課／隨時預約／已額滿／已結束
alter table public.courses add column if not exists sessions jsonb not null default '[]'::jsonb;  -- 上課場次 [{date,time,location,status}]
alter table public.courses add column if not exists summary text;           -- 一句話簡介（顯示在課程卡）
alter table public.courses add column if not exists summary_en text;
alter table public.courses add column if not exists early_price text;       -- 早鳥價，例如 NT$ 3,200
alter table public.courses add column if not exists early_deadline text;    -- 早鳥截止日，例如 11/1（六）
alter table public.courses add column if not exists signup_url text;        -- 報名表單網址；留空就顯示 LINE 報名
alter table public.courses add column if not exists note text;              -- 備註（顯示在費用下方）
alter table public.courses add column if not exists note_en text;

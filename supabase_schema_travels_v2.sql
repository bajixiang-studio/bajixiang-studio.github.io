-- 療癒旅行：新增「出發日期」與「費用」欄位（在 Supabase → SQL Editor 執行一次即可）
alter table public.travels add column if not exists travel_date    text;
alter table public.travels add column if not exists travel_date_en text;
alter table public.travels add column if not exists price_note     text;
alter table public.travels add column if not exists price_note_en  text;
-- 狀態多一種「隨時預約」（anytime）：若原本有限制只能填 upcoming / past，先移除該限制
alter table public.travels drop constraint if exists travels_status_check;

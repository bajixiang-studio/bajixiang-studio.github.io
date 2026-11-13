-- 八吉祥：療癒分享（學員心得）＋ 相片區可貼 YouTube／Facebook 影片網址
-- 到 Supabase → SQL Editor → New query，貼上全部內容按 Run。可重複執行。

-- 1) 療癒分享資料表
create table if not exists public.stories (
  id bigserial primary key,
  category text not null default '學員課後分享',
  name text,
  title text,
  content text,
  image_url text,
  video_url text,
  video_file_url text,
  visible boolean not null default true,
  sort_order int not null default 0,
  created_at timestamptz not null default now()
);

alter table public.stories enable row level security;

drop policy if exists "stories_read" on public.stories;
create policy "stories_read" on public.stories
  for select using (visible or public.is_admin());

drop policy if exists "stories_write" on public.stories;
create policy "stories_write" on public.stories
  for all to authenticated
  using (public.is_admin()) with check (public.is_admin());

-- 2) 相片區的 media_type 允許 'embed'（YouTube／Facebook 影片網址）
alter table public.gallery_images drop constraint if exists gallery_images_media_type_check;

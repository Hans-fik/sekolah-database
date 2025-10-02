-- Membuat tabel siswa

-- public.siswa definition
CREATE TABLE public.siswa (
	id serial4 NOT NULL,
	nama varchar(255) NOT NULL,
	umur int4 NULL,
	jurusan varchar(255) NULL,
	CONSTRAINT siswa_pkey PRIMARY KEY (id)
);


-- Membuat tabel nilai

-- public.nilai definition
CREATE TABLE public.nilai (
	id serial4 NOT NULL,
	siswa_id serial4 NOT NULL,
	mata_pelajaran varchar(255) NULL,
	nilai int4 NULL,
	CONSTRAINT nilai_pkey PRIMARY KEY (id)
);

-- public.nilai foreign keys
ALTER TABLE public.nilai 
ADD CONSTRAINT nilai_siswa_id_fkey FOREIGN KEY (siswa_id) REFERENCES public.siswa(id);
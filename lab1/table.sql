create table users (
	id SERIAL primary key,
	email varchar(50) NOT NULL,
	name varchar(30) NOT NULL,
	gender varchar(10),
	dob DATE NOT NULL,
	mobile_number varchar(10),
	password varchar(50) NOT NULL,
	created_at TIMESTAMP NOT NULL,
	update_at TIMESTAMP NOT NULL
);

create table user_device_tokens (
	id SERIAL primary key,
	device_token varchar(100),
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP NOT NULL,
	user_id int,
	CONSTRAINT fk_users_user_device_tokens FOREIGN KEY(user_id)
        REFERENCES users(id)
);

create table grades (
	id serial primary key,
	name varchar(10),
	name_char varchar(20),
	section varchar(5),
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP NOT NULL
)

create table students (
	id SERIAL primary key,
	user_id int, 
	grade_id int,
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP NOT NULL,
	CONSTRAINT fk_students_grades FOREIGN KEY(grade_id) REFERENCES grades(id),
	CONSTRAINT fk_students_users FOREIGN KEY(grade_id) REFERENCES grades(id)
)

create table teachers (
	id SERIAL primary key,
	user_id int,
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP NOT NULL,
	CONSTRAINT fk_teachers_users FOREIGN KEY(user_id) REFERENCES users(id)
);


create table parents (
	id SERIAL primary key,
	user_id int,
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP NOT NULL,
	CONSTRAINT fk_parents_users FOREIGN KEY(user_id) REFERENCES users(id)
);

create table parent_student_maps (
	id SERIAL primary key,
	student_id int,
	parent_id int,
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP NOT NULL,
	CONSTRAINT fk_parent_student_maps_students FOREIGN KEY(student_id) REFERENCES students(id),
	CONSTRAINT fk_parent_student_maps_parents FOREIGN KEY(parent_id) REFERENCES parents(id)
);

create table subjects (
	id SERIAL primary key,
	name varchar(50),
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP NOT NULL
);

create table grade_subject_maps (
	id SERIAL primary key,
	grade_id int, 
	subject_id int,
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP NOT NULL,
	CONSTRAINT fk_grade_subject_maps_grades FOREIGN KEY(grade_id) REFERENCES grades(id),
	CONSTRAINT fk_grade_subject_maps_subjects FOREIGN KEY(subject_id) REFERENCES subjects(id)
)


create table teacher_grade_subject_maps (
	id SERIAL primary key,
	teacher_id int,
	grade_subject_map_id int,
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP NOT NULL,
	CONSTRAINT fk_teacher_grade_subject_maps_teacher FOREIGN KEY(teacher_id) REFERENCES teachers(id),
	CONSTRAINT fk_teacher_grade_subject_maps_hrade_subject_maps FOREIGN KEY(grade_subject_map_id) REFERENCES grade_subject_maps(id)
);


create table merit_points (
	id SERIAL primary key,
	teacher_id int,
	subject_id int,
	student_id int,
	point int,
	remark varchar(50),
	terminal int,
	created_at TIMESTAMP NOT NULL,
	updated_at TIMESTAMP NOT NULL,
	CONSTRAINT fk_merit_points_teachers FOREIGN KEY(teacher_id) REFERENCES teachers(id),
	CONSTRAINT fk_merit_points_students FOREIGN KEY (student_id) REFERENCES students(id),
	CONSTRAINT fk_merit_points_subjects FOREIGN KEY (subject_id) REFERENCES subjects(id)
);


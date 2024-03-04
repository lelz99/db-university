-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT S.`id`, S.`name`, S.`surname`, D.`name` FROM `students` AS S JOIN `degrees` AS D ON D.`id` = S.`degree_id` WHERE D.`name` = 'Corso di Laurea in Economia';

-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT DEG.`id`, DEG.`name`, DEP.`name` FROM `degrees` AS DEG JOIN `departments` AS DEP ON DEP.`id` = DEG.`department_id` WHERE DEP.`name` = 'Dipartimento di Neuroscienze';

-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT T.`id`, T.`name`, T.`surname`, C.`name` FROM `course_teacher` AS CT JOIN `teachers` AS T ON T.`id` = CT.`teacher_id` JOIN `courses` AS C ON C.`id` = CT.`course_id` WHERE T.`surname` = 'Amato' AND T.`name` = 'Fulvio';

-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT S.`id`, S.`surname`, S.`name`, DEG.`name`, DEP.`name` FROM `students` AS S JOIN `degrees` AS DEG ON S.`degree_id` = DEG.`id` JOIN `departments` AS DEP ON DEP.`id` = DEG.`department_id` ORDER BY S.`surname` DESC, S.`name` DESC;

-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT D.`id`, D.`name`,C.`id`, C.`name`,T.`id`, T.`name`, T.`surname` FROM `degrees` AS D JOIN `courses` AS C ON D.`id` = C.`degree_id` JOIN `course_teacher` AS CT ON C.`id` = CT.`course_id` JOIN `teachers` AS T ON CT.`teacher_id` = T.`id` ;

-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT T.`id`, T.`name`, T.`surname`, DEP.`name` FROM `teachers` AS T JOIN `course_teacher` AS CT ON T.`id` = CT.`teacher_id` JOIN `courses` AS C ON CT.`course_id` = C.`id` JOIN `degrees` AS DEG ON C.`degree_id` = DEG.`id` JOIN `departments` AS DEP ON DEG.`department_id` = DEP.`id` WHERE DEP.`name` = 'Dipartimento di Matematica';

-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami
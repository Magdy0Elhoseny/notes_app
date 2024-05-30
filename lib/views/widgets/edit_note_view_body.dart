import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/models/note_models.dart';
import 'package:notes_app/views/widgets/cutoms/custom_appbar.dart';
import 'package:notes_app/views/widgets/cutoms/custom_text_field.dart';
import 'package:notes_app/views/widgets/edit_note_colors_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 30),
          CustomAppBar(
            title: 'Edit Note',
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = content ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            icon: Icons.check,
          ),
          const SizedBox(height: 32),
          CustomTextFormField(
            hintText: widget.note.title,
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 16),
          CustomTextFormField(
            hintText: widget.note.subTitle,
            onChanged: (value) {
              content = value;
            },
            maxLines: 5,
          ),
          const SizedBox(height: 16),
          EditNoteColorsList(
            note: widget.note,
          ),
        ],
      ),
    );
  }
}

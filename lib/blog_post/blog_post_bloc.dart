import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dummy_api_practice_app/blog_post/blog_post_event.dart';
import 'package:dummy_api_practice_app/blog_post/blog_post_state.dart';

import '../services/model/api/blog_post.dart';
import '../services/model/blog_post.dart';

class BlogPostBloc extends Bloc<BlogPostEvent, BlogPostState> {
  final BlogPostRepository blocPostRepo;
  BlogPostBloc({required this.blocPostRepo}) : super(BlogPostState()) {
    registerEvents();
    add(FetchBlogPostApi());
  }

  void registerEvents() {
    on<FetchBlogPostApi>(_onFetchBlogPostApi);
  }

  FutureOr<void> _onFetchBlogPostApi(
      FetchBlogPostApi event, Emitter<BlogPostState> emit) async {
    emit(state.copyWith(loading: true));
    try {
      final response = await blocPostRepo.fetchUsers();
      print('users : $response');
      final blogPost = response.map((json) => BlogPost.fromJson(json)).toList();
      emit(state.copyWith(loading: false, blogPost: blogPost));
    } catch (e) {
      emit(state.copyWith(loading: false, errorMessage: e.toString()));
    }
  }
}

import 'package:equatable/equatable.dart';

import '../services/model/blog_post.dart';

class BlogPostState extends Equatable {
  final bool loading;
  final String? errorMessage;
  final List<BlogPost>? blogPost;

  BlogPostState({
    this.loading = false,
    this.errorMessage,
    this.blogPost = const [],
  });

  BlogPostState copyWith({
    bool? loading,
    String? errorMessage,
    List<BlogPost>? blogPost,
  }) {
    return BlogPostState(
      loading: loading ?? this.loading,
      errorMessage: errorMessage ?? this.errorMessage,
      blogPost: blogPost ?? this.blogPost,
    );
  }

  List<Object?> get props => [
        loading,
        errorMessage,
        blogPost,
      ];
}

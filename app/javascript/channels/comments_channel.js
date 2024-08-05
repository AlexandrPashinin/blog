import consumer from "./consumer"

document.addEventListener('DOMContentLoaded', () => {
    const postId = document.querySelector('meta[name="post-id"]').getAttribute('content');
    const commentsChannel = consumer.subscriptions.create(
        { channel: "CommentsChannel", post_id: postId },
        {
            received(data) {
                const commentsContainer = document.getElementById('comments-container');
                commentsContainer.innerHTML += data.comment;
            }
        }
    );

    const commentForm = document.getElementById('comment-form');
    commentForm.addEventListener('submit', (event) => {
        event.preventDefault();
        const body = commentForm.querySelector('textarea').value;
        commentsChannel.send({ body: body });
        commentForm.reset();
    });
});
